#!/bin/bash

# Ansi color code variables
red="\e[0;91m"
red_bg="\e[0;101m${expand_bg}"
reset="\e[0m"

echo -e "\n${red_bg}${reset}"
echo -e "${red} Exporting static site for production... ${reset}"
echo -e "${red_bg}${reset}\n"
cd './hugo'
rm -rf public
hugo
cd './'
