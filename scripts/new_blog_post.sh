#!/bin/bash
# Inspired by https://discourse.gohugo.io/t/auto-generate-file-name-based-on-title/4648/2?u=kaushalmodi

# Assumes editor is Sublime because of editor-specific open command (see `open_file_cmd`).

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
reset="\e[0m"

# Home directory
title=""
here=$(pwd)

echo -e "\n${blue_bg}${reset}"
echo -e "${blue} Creating new blog post... ${reset}"
echo -e "${blue_bg}${reset}\n"
echo -e "${green}What is the title of your blog post?${reset}"
read title
echo -e "${green}What is the date of your blog post? (YYYY-MM-DD; hit return for default of $(date +%Y)-$(date +%m)-$(date +%d))${reset}"
read date

if [ -z "$date" ]
then
    date=$(date +%Y)-$(date +%m)-$(date +%d)
# else
    # echo -e "${green}Date will be set to ${date}."
fi

echo -e "\n${green}Creating '$title' on ${date}...${reset}"

# Create post
main () {
    # Remove leading and trailing whitespace from ${title}
    title=$(echo "${title}" | \sed -r -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Using ${title}
    #  - Replace '&' with "and", '.' with "dot", and apostrophes with nothing.
    #  - Then lower-case the whole title.
    #  - Then replace all characters except a-z, 0-9 and '-' with spaces.
    #  - Then remove leading/trailing spaces if any.
    #  - Then replace one or more spaces with a single hyphen.
    # For example, converts "This, That \& Other!" to "this-that-and-other.md"
    # (Note that we need to escape & with \ above, in the shell.)
    slug=$(echo "${title}" \
                | \sed -r -e 's/&/ and /g' \
                       -e 's/\./ dot /g' \
                       -e "s/'//g" \
                       -e 's/./\L\0/g' \
                       -e 's/[^a-z0-9-]/ /g' \
                       -e 's/^[[:space:]]*//g' \
                       -e 's/[[:space:]]*$//g' \
                       -e 's/[[:space:]]+/-/g');

    # Set date path format
    datepath=$(echo "${date}" | \sed -r -e 's/-/\//g')

    # Set paths
    path="blog/${datepath}"
    fullpath="content/${path}/index.md"

    # Create the new post
    # Need to first cd to the hugo blog root dir
    cd './hugo'
    hugo new "${path}"

    # Replace the title in TOML front matter with ${title}, and add slug
    tmp_file="/tmp/${USER}_hugo_post"
    \cp -f ${fullpath} ${tmp_file}
    \sed -r -e 's/^(\s*title: ).*/\1'"'${title}'"'/' \
         -e 's/^(\s*slug: ).*/\1'"'${slug}'"'/' \
         -e 's/^(\s*date: ).*/\1'"'${date}'"'/' \
         ${tmp_file} > ${fullpath}
    \rm -f ${tmp_file}

    # Open the file in EDITOR with cursor placed on the last line
    last_line=$(wc -l ${fullpath} | awk '{ print $1 }')
    open_file_cmd="subl ${fullpath}:${last_line}"
    eval "${open_file_cmd}"

    # Go back to the directory from where you launched this script
    cd ${here}
}

main
