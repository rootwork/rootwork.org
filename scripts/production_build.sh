#!/bin/bash

# Ansi color code variables
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
reset="\e[0m"

here=$(pwd) # Home directory

# Optimize images
npm run i

# Export site
notice="Exporting static site for production"
vars="--gc"

while getopts "m" flag; do
  case "$flag" in
    m)
      vars="$vars --minify"
      notice="$notice with minification disabled"
      ;;
    \?)
      echo -e "${red_bg}Invalid option.${reset}"
      exit
      ;;
  esac
done

notice="$notice..."

echo -e "\n${blue_bg}${reset}"
echo -e "${blue} ${notice} ${reset}"
echo -e "${blue_bg}${reset}\n"

cd './hugo' || exit
rm -rf public
hugo ${vars}
cd "$here" || exit
