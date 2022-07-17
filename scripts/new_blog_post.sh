#!/bin/bash

# ---------------------------------------------------------------------------
# new_blog_post - Create new Hugo blog posts with automated year and month
# categories by tag.
#
# Inspired by https://discourse.gohugo.io/t/auto-generate-file-name-based-on-title/4648/2?u=kaushalmodi
#
# This script will:
#
#  - Ask you for a title
#  - Ask you for a date (defaults to today)
#  - Create an appropriate slug without words or symbols that don't add to SEO
#  - Optionally create a short alias based on the date
#  - Create taxonomy year and month files, if necessary (cf. gohugoio/hugo#448 )
#  - Create the necessary Markdown file, with sane defaults, at the appropriate
#    directory/file location
#  - Open the file in your text editor
#
# It does much more than just `hugo new`
#
# The title, date, slug, Hugo directory, and whether to open the file
# automatically are all controllable via flags. For use with Sublime Text, you
# can also use the -o|--open-at-end flag to open the file with the cursor at the
# end.
#
# There is a dedicated -g|--gitpod flag that optimizes the script for running in
# Gitpod.
#
# If a blog entry already exists for a given date, the script will append "b" to
# the date to avoid overwriting existing files. Personally, I rarely post more
# than even one blog post on the same day, so if two blog posts already exist the
# script will simply error and exit. Patches or forks welcome to create more
# robust behavior.
#
# The optional short alias (-a|--alias) flag adds an alias based on the date, in
# the form: '/p/YYMMDD'
#
# Note that to pass flags to this script via npm you must prepend it with an
# empty flag, e.g.:
#
# npm run n -- -g
#
# REQUIREMENTS
#
# The following keys must be present in your Hugo post archetype (either as
# default.md or as blog/index.md):
#
# title
# date
# slug
#
# Add the following custom keys to your archetype to allow for the taxonomy-
# based date archives:
#
# year
# month
#
# Finally, to use the optional alias flag, you must have an "aliases" key,
# though it can be commented out. The alias this script adds will not
# interfere with any other aliases you may be creating.

# Copyright 2022, Ivan Boothe <git@rootwork.org>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License at <http://www.gnu.org/licenses/> for
# more details.

# USAGE
#
# $ ./new_blog_post.sh [--title="<string>"] [--slug="<URL-safe string>"] [--date="YYYY-MM-DD"] [--hugo-dir="<path>"] [--content-dir="<path>"] [--blog-dir="<path>"] [--editor="<path>"] [-a|--alias] [-o|--open-at-end] [-q|quiet]
# $ ./new_blog_post.sh [-g|--gitpod] [-q|quiet]
# $ ./new_blog_post.sh [-h|--help]

# EXAMPLES
#
# Create a new blog post and use interactive mode to prompt for information:
# $ ./new_blog_post.sh
#
# Create a new blog post using interactive mode, specifying directory path of
# Hugo and command to open Sublime Text editor:
# $ ./new_blog_post.sh --hugo-dir="./hugo" --editor="subl"
#
# Create a new blog post using interactive mode, optimized for Gitpod:
# $ ./new_blog_post.sh -g
#
# Create a new blog post, specifying title, date and slug, and creating an
# automatic short alias:
# $ ./new_blog_post.sh --title="My new blog entry" --date="2022-05-24" --slug="new-post" -a

# Revision history:
# 2022-07-09  Added short alias option; handle blog entries on same date (1.1)
# 2022-05-26  Full release; script configurable via flags (1.0)
# 2022-03-29  Adding configurable Hugo directory (0.4)
# 2022-03-22  Making script configurable via editing (0.3)
# 2021-09-01  Updating directory structure of generated tags (0.2)
# 2021-08-19  Initial unversioned release (0.1)
# ---------------------------------------------------------------------------

# Standard settings and variables
set -euo pipefail
IFS=$'\n\t'
PROGNAME=${0##*/}
VERSION="1.1"

# tput colors (for printf)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)
reverse=$(tput smso)

# Error handling
error_exit() {
  local error_message="${red}$1${reset}"

  printf "%s\n" "${PROGNAME}: ${error_message:-"${red}Unknown Error${reset}"}" >&2
  exit 1
}

graceful_exit() {
  exit 0
}

signal_exit() {

  local signal="$1"

  case "$signal" in
    INT)
      error_exit "${yellow}Program interrupted by user.${reset}"
      ;;
    TERM)
      printf "\n%s\n" "${red}$PROGNAME: Program terminated.${reset}" >&2
      graceful_exit
      ;;
    *)
      error_exit "${red}$PROGNAME: Terminating on unknown signal.${reset}"
      ;;
  esac
}

# Usage: Separate lines for mutually exclusive options.
usage() {
  printf "%s\n" \
    "${bold}Usage:${reset} ${PROGNAME} [--title=\"<string>\"] [--slug=\"<URL-safe string>\"] [--date=\"YYYY-MM-DD\"] [--hugo-dir=\"<path>\"] [--content-dir=\"<path>\"] [--blog-dir=\"<path>\"] [--editor=\"<path>\"] [-a|--alias] [-o|--open-at-end] [-q|quiet]"
  printf "%s\n" \
    "       ${PROGNAME} [-g|--gitpod] [-q|quiet]"
  printf "%s\n" \
    "       ${PROGNAME} [-h|--help]"
}

# Help message for --help
help_message() {
  cat <<-_EOF_

${bold}${PROGNAME} ${VERSION}${reset}
${cyan}
Create new Hugo blog posts with automated year and month categories by
tag.${reset}

$(usage)

${bold}Options:${reset}
--title            Specify title.
--date             Specify date, in format YYYY-MM-DD.
--slug             Specify slug. Use URL-safe values.
--editor           Command to run editor, defaults to xdg-open.
--hugo-dir         Specify location of your Hugo instance, relative to the
                   directory from which you run this script. No trailing slash.
                   Defaults to the current directory.
--content-dir      Specify subdirectory of your Hugo instance containing
                   your content files. No leading or trailing slashes. Defaults
                   to 'content'
--blog-dir         Specify subdirectory of your Hugo content directory
                   containing blog posts. No leading or trailing slashes.
                   Defaults to 'blog'
-a, --alias        Include a short alias based on the date. A blog post written
                   on June 1, 2022, will generate the alias '/p/220601'.
                   This can be changed in the post's front matter once created.
-o, --open-at-end  Whether to open the file with the cursor placed at the end.
                   Only guaranteed to work for Sublime Text.
-g, --gitpod       Run optimized for a Gitpod environment.
-q, --quiet        Quiet mode.
-h, --help         Display this help message and exit.

${bold}Examples:${reset}

Create a new blog post and use interactive mode to prompt for information:

${green}$ ${PROGNAME}${reset}

Create a new blog post using interactive mode, specifying path of Hugo and the
command to open Sublime Text editor:

${green}$ ${PROGNAME} --hugo-dir="./hugo" --editor="subl"${reset}

Create a new blog post using interactive mode, optimized for Gitpod:

${green}$ ${PROGNAME} -g${reset}

Create a new blog post, specifying title, date and slug, and creating an
automatic short alias:

${green}$ ${PROGNAME} --title="My new blog entry" --date="2022-05-24" --slug="new-post" -a${reset}

_EOF_
}

# Options and flags from command line
needs_arg() {
  if [[ -z "$OPTARG" ]]; then
    error_exit "Error: Argument required for option '$OPT' but none provided."
  fi
}

# Home directory
here=$(pwd)

# Set variable defaults.
quiet_mode=false
title=""
date=""
slug=""
hugo_dir="."
content_dir="content"
blog_dir="blog"
editor="xdg-open"
alias=false
open_at_end=false
gitpod=false

# Run the comparison (be sure to change the "getopts" below!)
while getopts :goea-:qh OPT; do
  # Using help flag only? The above should be:
  # while getopts :-:h OPT; do
  if [[ "$OPT" = "-" ]]; then # long option: reformulate OPT and OPTARG
    OPT="${OPTARG%%=*}"       # extract long option name
    OPTARG="${OPTARG#$OPT}"   # extract long option argument (may be empty)
    OPTARG="${OPTARG#=}"      # remove assigning `=`
  else
    OPTARG="${OPTARG:-}"
  fi
  case "$OPT" in
    h | help)
      help_message
      graceful_exit
      ;;
    title)
      needs_arg
      title="$OPTARG"
      ;;
    date)
      needs_arg
      date="$OPTARG"
      ;;
    slug)
      needs_arg
      slug="$OPTARG"
      ;;
    hugo-dir)
      needs_arg
      hugo_dir="$OPTARG"
      ;;
    content-dir)
      needs_arg
      content_dir="$OPTARG"
      ;;
    blog-dir)
      needs_arg
      blog_dir="$OPTARG"
      ;;
    editor)
      needs_arg
      editor="$OPTARG"
      ;;
    o | open-at-end)
      open_at_end=true
      ;;
    a | alias)
      alias=true
      ;;
    g | gitpod)
      gitpod=true
      editor="open"
      open_at_end=false
      ;;
    q | quiet)
      quiet_mode=true
      ;;
    ??*) # bad long option
      usage >&2
      error_exit "Unknown option --$OPT"
      ;;
    ?) # bad short option
      usage >&2
      error_exit "Unknown option -$OPTARG"
      ;;
  esac
done
shift $((OPTIND - 1)) # remove parsed options and args from $@ list

# Open command
open=$(command -v ${editor})
if [[ ! $open ]]; then
  error_exit "${red}${reverse}Editor '${editor}' cannot be found. Aborting.${reset}"
fi

# Notify user
if [[ $quiet_mode != "true" ]]; then
  msg="Creating new blog post"
  if [[ $gitpod = "true" ]]; then
    msg="${msg} in Gitpod mode"
  fi
  printf "\n%s\n\n" "${cyan}${reverse}${msg}...${reset}"
fi

# Check and process dates
if [ -z "$date" ]; then
  printf "%s\n" "${green}What is the date of your blog post? (YYYY-MM-DD; hit return for default of ${cyan}$(date +%Y)-$(date +%m)-$(date +%d)${green})${reset}"
  read -r date
fi

if [ -z "$date" ]; then
  date=$(date +%Y)-$(date +%m)-$(date +%d)
else
  if [[ ! ($date =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$) ]]; then
    error_exit "${red}${reverse}Date is malformed; retry with valid YYYY-MM-DD.${reset}"
  fi
fi

dateregex="([0-9]{4})-([-0-9]{2})-([0-9]{2})"
if [[ $date =~ $dateregex ]]; then
  date_year="${BASH_REMATCH[1]}"
  date_year_short="${date_year:2}"
  date_month="${BASH_REMATCH[2]}"
  date_day="${BASH_REMATCH[3]}"
fi

# Set paths based on date
blog_path="${blog_dir}/${date_year}-${date_month}-${date_day}"
content_path="${content_dir}/${blog_path}/index.md"
full_path="${hugo_dir}/${content_path}"

if [ -f "$full_path" ]; then
  blog_path="${blog_path}b"
  content_path="${content_dir}/${blog_path}/index.md"
  full_path="${hugo_dir}/${content_path}"
  if [ -f "$full_path" ]; then
    error_exit "${red}${reverse}Two blog entries already exist on that date.${reset} ${red}Exiting.${reset}"
  fi
  if [[ $quiet_mode != "true" ]]; then
    printf "%s\n" "${yellow}A blog entry already exists for ${date}, so the path for this blog will be '${full_path}'.${reset}"
  fi
fi

# Collect title
if [ -z "$title" ]; then
  printf "%s\n" "${green}What is the title of your blog post?${reset}"
  read -r title
fi

# Notify user
if [[ $quiet_mode != "true" ]]; then
  printf "\n%s\n" "${cyan}${reverse}Creating '$title' on ${date_year}-${date_month}-${date_day} at ${full_path} ...${reset}"
fi

main() {
  # Remove leading and trailing whitespace from ${title}
  title=$(echo "${title}" | \sed -r -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # Using ${title}
  #  - Replace '&' with 'and', '.' with 'dot', and apostrophes with nothing.
  #  - Then lower-case the whole title.
  #  - Then remove common words that don't help with SEO in URLs (stop words).
  #  - Then replace all characters except a-z, 0-9 and '-' with spaces.
  #  - Then remove further leading/trailing spaces if any.
  #  - Then replace one or more spaces with a single hyphen.
  # For example, converts 'This, That \& Other!' to 'this-that-and-other.md'
  # (Note that we need to escape & with \ above, in the shell.)
  slug=$(echo "${title}" |
    \sed -r -e 's/&/ and /g' \
      -e 's/\./ dot /g' \
      -e "s/'//g" \
      -e 's/./\L\0/g' \
      -e "s/\<a\>//g;s/\<an\>//g;s/\<and\>//g;s/\<as\>//g;s/\<at\>//g;s/\<for\>//g;s/\<from\>//g;s/\<in\>//g;s/\<of\>//g;s/\<on\>//g;s/\<or\>//g;s/\<the\>//g;s/\<to\>//g" \
      -e 's/[^a-z0-9-]/ /g' \
      -e 's/^[[:space:]]*//g' \
      -e 's/[[:space:]]*$//g' \
      -e 's/[[:space:]]+/-/g')

  # Create the new post
  # Need to first cd to the hugo blog root dir
  cd "$hugo_dir" || exit
  hugo new "${blog_path}"

  # Set sed find-and-replace strings in the archetype file.
  regex_title="s/^(\s*title: ).*/\1'${title}'/"
  regex_slug="s/^(\s*slug: ).*/\1'${slug}' # Recommended length is 3 to 5 words./"
  regex_date="s/^(\s*date: ).*/\1'${date_year}-${date_month}-${date_day}'/"
  regex_month="s/^(\s*month: ).*/\1'${date_year}-${date_month}'/"
  regex_year="s/^(\s*year: ).*/\1'${date_year}'/"

  # Set optional alias.
  regex_alias1=""
  regex_alias2=""
  if [[ $alias = "true" ]]; then
    alias_name="\/p\/${date_year_short}${date_month}${date_day}"
    regex_alias1="s/^\s*# aliases:/aliases:/"
    regex_alias2="s/^\s*aliases:/aliases:\n  - '${alias_name}'/"
  fi

  # Set the title, slug, date and taxonomy-dates.
  tmp_file="/tmp/${USER}_hugo_post"
  cp -f "$content_path" "$tmp_file"
  sed -r \
    -e "$regex_title" \
    -e "$regex_slug" \
    -e "$regex_date" \
    -e "$regex_year" \
    -e "$regex_month" \
    -e "$regex_alias1" \
    -e "$regex_alias2" \
    "$tmp_file" >"$content_path"

  # Remove the temporary file.
  rm -f "$tmp_file"

  # Create year and month taxonomy pages for this date, if they don't already
  # exist.
  yearpath="${content_dir}/year/${date_year}"
  if [ ! -d "$yearpath" ]; then
    mkdir "$yearpath"
    cat <<EOF >"${yearpath}/_index.md"
---
title: 'Archives: ${date_year}'
url: '/${blog_dir}/${date_year}/'
---
EOF
    echo "Created taxonomy page for ${date_year}"
  fi
  monthpath="${content_dir}/month/${date_year}-${date_month}"
  if [ ! -d "$monthpath" ]; then
    prettymonth=$(date -d "$date" +'%B')
    mkdir "$monthpath"
    cat <<EOF >"${monthpath}/_index.md"
---
title: 'Archives: ${prettymonth} ${date_year}'
url: '/${blog_dir}/${date_year}/${date_month}'
---
EOF
    echo "Created taxonomy page for ${date_year}-${date_month}"
  fi

  open_args="$content_path"

  # Optionally open file on the last line
  if [[ $open_at_end = "true" ]]; then
    line_count=$(wc -l "$content_path" | awk '{ print $1 }')
    last_line=$(echo "${line_count} + 1" | bc)
    open_args="$content_path:${last_line}"
  fi

  # Open the file
  open_file_cmd="$open $open_args"
  eval "${open_file_cmd}"

  # Go back to the directory from where you launched this script
  cd "${here}" || exit
}

main
