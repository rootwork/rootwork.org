#!/bin/bash

######################
# USER CONFIGURATION #
######################

# Path to your Hugo directory (relative to the path from which you run this script)
hugo_dir="./hugo" # No trailing slash

# Path to the directory in which your site should be generated
dist_dir="./hugo/public" # This subdirectory will be DELETED on build.

# Whether to include the image optimization and modern-format script
process_images=false

##########
# SCRIPT #
##########

# Ansi color code variables
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
yellow="\e[1;33m"
reset="\e[0m"

here=$(pwd) # Home directory

# Optimize images
if [[ $process_images = "true" ]]; then
  "$here"/scripts/image_optimize.sh
fi

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

echo -e "${yellow}Removing directory ${dist_dir}${reset}\n"
rm -rf "$dist_dir"

cd "$hugo_dir" || exit
hugo $vars
cd "$here" || exit
