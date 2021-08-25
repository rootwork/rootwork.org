#!/bin/bash

shopt -s nullglob # Globs that match nothing expand to nothing
shopt -s globstar # ** matches multiple directory levels

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
reset="\e[0m"

echo -e "\n${green}Optimizing images in content...${reset}"
echo -e "${blue}"

# Optimize png, jpg
# 'mogrify' is imagemagick
for f in ./hugo/content/**/*.{jpg,jpeg,png,gif}; do
  if [ -e "$f" ] ; then
    mogrify -strip -thumbnail '1000>' "$f";
    echo -e "${f}";
  fi
done

echo -e "${reset}"
echo -e "${green}                                ...done.${reset}"

echo -e "\n${green}Creating modern image formats...${reset}"
echo -e "${blue}"

# Create webp from jpeg and png files; gif files are likely to be larger in webp.
# https://developers.google.com/speed/webp/docs/cwebp
for f in ./hugo/content/**/*.{jpg,jpeg,png}; do
  webp="${f%.*}.webp"
  if [ -e "$f" ] ; then
    if [ ! -e "${webp}" ]; then # Create only if file doesn't exist.
      cwebp -quiet "$f" -o "${webp}";
      echo -e "${webp}";
    fi
  fi
done

# Create avif from webp files, and any gif files.
# https://github.com/lovell/avif-cli
for f in ./hugo/content/**/*.{webp,gif}; do
  avif="${f%.*}.avif"
  if [ -e "$f" ] ; then
    if [ ! -e "${avif}" ]; then # Create only if file doesn't exist.
      dir="$(dirname "${f}")"
      npx avif --input="$f" --output="$dir"
      echo -e "${avif}";
    fi
  fi
done

echo -e "${reset}"
echo -e "${green}                                ...done.${reset}\n"
