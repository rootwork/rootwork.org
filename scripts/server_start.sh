#!/bin/bash

# Ansi color code variables
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
reset="\e[0m"

echo -e "\n${green_bg}${reset}"
echo -e "${green} Running web server with drafts enabled... ${reset}"
echo -e "${green_bg}${reset}\n"
cd './hugo'
xdg-open http://localhost:1313/
hugo server --buildDrafts
cd './'
