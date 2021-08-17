#!/bin/bash

# Ansi color code variables
blue="\e[0;94m"
blue_bg="\e[0;104m${expand_bg}"
green="\e[0;92m"
reset="\e[0m"

echo -e "\n${blue_bg}${reset}"
echo -e "${blue} Creating new blog post... ${reset}"
echo -e "${blue_bg}${reset}\n"
echo -e "${green}What is the title of your blog post?${reset}"
read post_title
cd './hugo'
hugo new --kind blog blog/$(date +%Y)/$(date +%m)/$(date +%d)/index.md "$post_title"
cd './'
