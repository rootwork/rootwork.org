---
title: "{{ replace .Name "-" " " | title }}"
author: ivan
date: '{{ .Date | dateFormat "2006-01-02" }}'

slug: '{{ .Name }}' # Recommended length is 3 to 5 words.
# aliases:

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Description

draft: true # Change to 'false' to publish this post.
disable_feed: false # Change to 'true' to exclude from RSS etc.
unlisted: false # Change to 'true' to exclude from search, lists, sitemaps, and feeds.

featured: false
toc: false

showDate: false
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

# keywords: # Pages do not have tags or categories; add keywords here to include them in metadata for SEO.
---
