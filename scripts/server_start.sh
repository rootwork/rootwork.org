#!/bin/bash

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
expand_bg="\e[K"
green_bg="\e[0;102m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
reset="\e[0m"

# Help text
show_help()
{
  echo -e "${blue}
  Usage: ${green}npm run s [--] [-d] [-s] [-h]${blue}

  ${green}-d${blue}  Build with drafts (--buildDrafts)
  ${green}-s${blue}  Build without fastRender (--disableFastRender)
  ${green}-h${blue}  Display this help

  Examples:  ${green}npm run s
             npm run s -- -d
             npm run s -- -ds${blue}

  Note that the '--' after the script name is required for npm to pass the argument.
  ${reset}"
  exit 0
}

notice="Running web server"

while getopts "dsh" flag; do
  case "$flag" in
    d)
      vars="$vars --buildDrafts"
      notice="$notice with drafts enabled"
      ;;
    s)
      vars="$vars --disableFastRender"
      notice="$notice without fastRender"
      ;;
    h)
      show_help
      ;;
    \?)
      echo -e "${red_bg}Invalid option. Use -h flag for help.${reset}"
      exit
      ;;
  esac
done

notice="$notice..."

echo -e "\n${green_bg}${reset}"
echo -e "${green} ${notice} ${reset}"
echo -e "${green_bg}${reset}\n"
cd './hugo'
xdg-open http://localhost:1313/
hugo server ${vars}
cd './'
