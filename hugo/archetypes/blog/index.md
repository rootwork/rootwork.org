---
title: '{{ replace .Name "-" " " | title }}'
author: Ivan Boothe
date: '{{ .Date | dateFormat "2006-01-02" }}'
# lastmod: {{ .Date | dateFormat "2006-01-02" }} # Appends 'edited on' to the publish date

slug: '{{ .Name }}' # Recommended length is 3 to 5 words.
aliases:
  - /p/{{ .Date | dateFormat "06" }}{{ .Date | dateFormat "01" }}{{ .Date |
    dateFormat "02" }}
description: 'Post description.' # For SEO and social media snippets.
summary: 'Post summary.' # For the post in lists.

draft: true # Change to 'false' to publish this post.
featured: true
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

# featureImage: 'feature.jpg' # Top image on post.
# featureImageAlt: 'Description of image' # Alternative text for featured image.
# featureImageCap: 'This is the featured image.' # Caption (optional).
# featureImageCreditFlickr: 'username
# featureImageCreditCustom: 'Image credit Flickr user [username](https://www.flickr.com/photos/username "View this person's Flickr stream").'
# thumbnail: 'thumbnail.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - Planet Drupal
tags:
  - Drupal
keywords: # For SEO. Generally a combination of categories and tags.
  - Drupal

# Archive taxonomy terms (auto-generated)
year: '{{ .Date | dateFormat "2006" }}'
month: '{{ .Date | dateFormat "2006-01" }}'
---
