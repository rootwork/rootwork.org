#!/bin/bash

# Ansi color code variables
green="\e[0;92m"
expand_bg="\e[K"
green_bg="\e[0;102m${expand_bg}"
reset="\e[0m"

echo -e "\n${green_bg}${reset}"
echo -e "${green} Running web server with drafts enabled... ${reset}"
echo -e "${green_bg}${reset}\n"
cd './hugo'
xdg-open http://localhost:1313/
hugo server --buildDrafts --disableFastRender --gc
cd './'
