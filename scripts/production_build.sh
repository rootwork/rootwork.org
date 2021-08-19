#!/bin/bash

# Ansi color code variables
blue="\e[0;94m"
green="\e[0;92m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
reset="\e[0m"

here=$(pwd) # Home directory
vars="--gc"
minify=""

echo -e "\n${blue_bg}${reset}"
echo -e "${blue}Exporting static site for production...${reset}"
echo -e "${blue_bg}${reset}\n"
echo -e "${green}Minify HTML? (return for yes)${reset}"
read minify

# By default, we want it minified. If user enters anything other than a
# return, don't include it. If you came here wanting to fine-tune how the
# minification in Hugo happens, see
# https://gohugo.io/getting-started/configuration/#configure-minify
if [ -z "$minify" ]; then
  vars="$vars --minify"
fi

cd './hugo'
rm -rf public
hugo ${vars}
cd ${here}
