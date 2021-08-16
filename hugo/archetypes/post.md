---
title: "{{ replace .Name "-" " " | title }}"
author: "Ivan Boothe"
date: "{{ .Date }}"

slug: "{{ replace .Name "-" " " | title }}"
# aliases:
#   -
description: "Post description." # For SEO and social media snippets.
summary: "Post summary." # For the post in lists.

draft: true
featured: true
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: "/images/path/file.jpg" # Top image on post.
thumbnail: "/images/path/thumbnail.png" # Image in lists of posts.
# shareImage: "/images/path/share.png" # For SEO and social media snippets.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.

categories:
  - Planet Drupal
tags:
  - Drupal
keywords: # For SEO
  - Drupal

---

**Insert Lead paragraph here.**
