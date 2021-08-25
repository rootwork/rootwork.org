#!/bin/bash

shopt -s nullglob # Globs that match nothing expand to nothing
shopt -s globstar # ** matches multiple directory levels

# Ansi color code variables
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
reset="\e[0m"

echo -e "\n${green}Optimizing images in content...${reset}"

# Optimize png, jpg
# Inspired by https://victoria.dev/blog/how-to-quickly-batch-resize-compress-and-convert-images-with-a-bash-one-liner/
echo -e "${blue}"
find hugo/content/ -not -path "*/static/*" \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \) -print0 | xargs -0 -P8 -n2 mogrify -strip -thumbnail '1000>' -verbose
echo -e "${reset}"
echo -e "${green}                               ...done.${reset}"

echo -e "\n${green}Creating modern image formats...${reset}"
echo -e "${blue}"

# Create webp from jpeg and png files; gif files are likely to be larger in webp.
# https://developers.google.com/speed/webp/docs/cwebp
for f in ./hugo/content/**/*.{jpg,jpeg,png}; do
  if [ -e "$f" ] ; then
    cwebp -quiet "$f" -o "${f%.*}.webp";
    echo -e "${f%.*}.webp" | sed 's/^\.\///g';
  fi
done

# Create avif from webp files, and any gif files.
# https://github.com/lovell/avif-cli
for f in ./hugo/content/**/*.{webp,gif}; do
  if [ -e "$f" ] ; then
    dir="$(dirname "${f}")"
    npx avif --input="$f" --output="$dir"
    echo -e "${f%.*}.avif" | sed 's/^\.\///g';
  fi
done

# grep -P '\K[^\/]*\.avif')

echo -e "${reset}"
echo -e "${green}                               ...done.${reset}\n"
