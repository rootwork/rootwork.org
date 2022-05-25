#!/bin/bash

######################
# USER CONFIGURATION #
######################

# Platform-specific command for opening a browser window
# Linux: xdg-open
# Mac: open
# Windows: start (or `powershell.exe -c start` outside of shell)
open_browser=xdg-open

# URL and port settings
url="http://localhost"
port="1313"

##########
# SCRIPT #
##########

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
expand_bg="\e[K"
green_bg="\e[0;102m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
reset="\e[0m"

# Help text
show_help() {
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

# Open command
open=$(command -v ${open_browser})
if [[ ! $open ]]; then
  echo -e "${red_bg}Error: '${open_browser}' is not installed. Check line 11 of ${0##*/}. Aborting.${reset}\n" >&2
  exit 1
fi

here=$(pwd) # Home directory

# Default variables
notice="Running web server"
vars="--baseURL ${url} --port ${port}"

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
cd './hugo' || exit
hugo server ${vars} &
HUGO_PID=$!
sleep 1s && "$open" "${url}:${port}"
cd "${here}" || exit
wait "$HUGO_PID"
