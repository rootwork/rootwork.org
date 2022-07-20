---
title: '{{ replace .Name "-" " " | title }}'
author: Ivan Boothe
date: '{{ .Date | dateFormat "2006-01-02" }}'
# lastmod: '{{ .Date | dateFormat "2006-01-02" }}' # Appends 'edited on' to the publish date

slug: '{{ .Name }}' # Recommended length is 3 to 5 words.
# aliases:
description: 'Description' # For SEO and social media snippets.
summary: 'Summary' # For the post in lists.

draft: true # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

# featureImage: 'feature.jpg' # Top image on post.
# featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
# featureImageAlt: 'Description of image' # Alternative text for featured image.
# featureImageCreditFlickr: 'username'
# featureImageCreditCustom: 'Top image credit Flickr user [username](https://www.flickr.com/photos/username).'
# thumbnail: 'thumbnail.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - frontend development
tags:
  - Drupal
keywords: # Extra keywords in addition to the above, for SEO.
  -

# Archive taxonomy terms (auto-generated)
year: '{{ .Date | dateFormat "2006" }}'
month: '{{ .Date | dateFormat "2006-01" }}'
---
