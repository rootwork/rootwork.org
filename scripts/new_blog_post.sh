#!/bin/bash
# Inspired by https://discourse.gohugo.io/t/auto-generate-file-name-based-on-title/4648/2?u=kaushalmodi

# Assumes editor is Sublime because of editor-specific open command (see `open_file_cmd`).

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
red_bg="\e[0;101m${expand_bg}"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
reset="\e[0m"

here=$(pwd) # Home directory
title=""

echo -e "\n${blue_bg}${reset}"
echo -e "${blue} Creating new blog post... ${reset}"
echo -e "${blue_bg}${reset}\n"
echo -e "${green}What is the title of your blog post?${reset}"
read title
echo -e "${green}What is the date of your blog post? (YYYY-MM-DD; hit return for default of $(date +%Y)-$(date +%m)-$(date +%d))${reset}"
read date

if [ -z "$date" ]; then
  date=$(date +%Y)-$(date +%m)-$(date +%d)
else
  if [[ !($date =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$) ]]; then
    echo -e "${red_bg}Date is malformed; retry with valid YYYY-MM-DD.${reset}" && exit 1
  fi
fi

# Separate date variables
dateregex="([0-9]{4})-([-0-9]{2})-([0-9]{2})"
if [[ $date =~ $dateregex ]]; then
  date_year="${BASH_REMATCH[1]}"
  date_month="${BASH_REMATCH[2]}"
  date_day="${BASH_REMATCH[3]}"
fi

echo -e "\n${green}Creating '$title' on ${date_year}-${date_month}-${date_day}...${reset}"

main () {
  # Remove leading and trailing whitespace from ${title}
  title=$(echo "${title}" | \sed -r -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # Using ${title}
  #  - Replace '&' with 'and', '.' with 'dot', and apostrophes with nothing.
  #  - Then lower-case the whole title.
  #  - Then remove common words that don't help with SEO in URLs (stop words).
  #  - Then replace all characters except a-z, 0-9 and '-' with spaces.
  #  - Then remove leading/trailing spaces if any.
  #  - Then replace one or more spaces with a single hyphen.
  # For example, converts 'This, That \& Other!' to 'this-that-and-other.md'
  # (Note that we need to escape & with \ above, in the shell.)
  slug=$(echo "${title}" \
    | \sed -r -e 's/&/ and /g' \
    -e 's/\./ dot /g' \
    -e "s/'//g" \
    -e 's/./\L\0/g' \
    -e "s/\<a\>//g;s/\<an\>//g;s/\<and\>//g;s/\<at\>//g;s/\<in\>//g;s/\<of\>//g;s/\<on\>//g;s/\<or\>//g;s/\<the\>//g;s/\<to\>//g" \
    -e 's/[^a-z0-9-]/ /g' \
    -e 's/^[[:space:]]*//g' \
    -e 's/[[:space:]]*$//g' \
    -e 's/[[:space:]]+/-/g');

  # Set paths
  path="blog/${date_year}/${date_month}/${date_day}"
  fullpath="content/${path}/index.md"

  # Create the new post
  # Need to first cd to the hugo blog root dir
  cd './hugo'
  hugo new "${path}"

  # Set the title, slug, date and taxonomy-dates.
  tmp_file="/tmp/${USER}_hugo_post"
  \cp -f ${fullpath} ${tmp_file}
  \sed -r -e 's/^(\s*title: ).*/\1'"'${title}'"'/' \
  -e 's/^(\s*slug: ).*/\1'"'${slug}' # Recommended length is 3 to 5 words."'/' \
  -e 's/^(\s*date: ).*/\1'"'${date_year}-${date_month}-${date_day}'"'/' \
  -e 's/^(\s*year: ).*/\1'"'${date_year}'"'/' \
  -e 's/^(\s*month: ).*/\1'"'${date_year}-${date_month}'"'/' \
  ${tmp_file} > ${fullpath}
  \rm -f ${tmp_file}

  # Create year and month taxonomy pages for this date, if they don't already
  # exist.
  yearpath="content/year/${date_year}"
  if [ ! -d "$yearpath" ]; then
    mkdir ${yearpath}
    cat << EOF > ${yearpath}/_index.md
---
title: 'Archives: ${date_year}'
url: '/blog/${date_year}/'
---
EOF
    echo "Created taxonomy page for ${date_year}"
  fi
  monthpath="content/month/${date_year}-${date_month}"
  if [ ! -d "$monthpath" ]; then
    prettymonth=$(date -d "$date" +'%B')
    mkdir ${monthpath}
    cat << EOF > ${monthpath}/_index.md
---
title: 'Archives: ${prettymonth} ${date_year}'
url: '/blog/${date_year}/${date_month}'
---
EOF
    echo "Created taxonomy page for ${date_year}-${date_month}"
  fi

  # Open the file in Sublime with cursor placed on the last line
  last_line=$(wc -l ${fullpath} | awk '{ print $1 }')
  open_file_cmd="subl ${fullpath}:${last_line}"
  eval "${open_file_cmd}"

  # Go back to the directory from where you launched this script
  cd ${here}
}

main
