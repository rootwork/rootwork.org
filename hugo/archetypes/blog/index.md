---
title: '{{ replace .Name "-" " " | title }}'
author: 'Ivan Boothe'
date: '{{ .Date | dateFormat "2006-01-02" }}'
# lastmod: '{{ .Date | dateFormat "2006-01-02" }}' # Appends 'edited on' to the publish date

slug: '{{ .Name }}' # Recommended length is 3 to 5 words.
# aliases:
#   -
description: 'Post description.' # For SEO and social media snippets.
summary: 'Post summary.' # For the post in lists.

draft: true # Change to 'false' to publish this post.
featured: true
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: './feature.jpg' # Top image on post.
thumbnail: './thumbnail.jpg' # Image in lists of posts.
# shareImage: './share.jpg' # For SEO and social media snippets.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.

categories:
  - Planet Drupal
tags:
  - Drupal
keywords: # For SEO
  - Drupal

# Archive taxonomy terms (auto-generated)
year: '{{ .Date | dateFormat "2006" }}'
month: '{{ .Date | dateFormat "2006-01" }}'

---

