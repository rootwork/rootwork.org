---
title: 'Automating post creation tasks in Hugo'
author: ivan
date: '2022-10-03'
# lastmod: '2022-10-03' # Appends 'edited on' to the publish date

slug: 'automating-post-creation-tasks-hugo' # Recommended length is 3 to 5 words.
aliases:
  - /p/221003

# For the post as it appears in lists.
summary: >
  Summary

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Description

draft: false # Change to 'false' to publish this post.
disable_feed: false # Change to 'true' to exclude from RSS etc.
unlisted: false # Change to 'true' to exclude from search, lists, sitemaps, and feeds.
# priority: '1.0' # Override the sitemap priority for this post, range 1.0 (high) to 0.0 (low)

featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'duvel-assembly-line_flickr-jim.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
# featureImageAlt: 'Description of image' # Alternative text for featured image.
# featureImageCreditFlickr: 'Jim'
featureImageCreditCustom:
  'Top image credit Flickr user
  [Jim](https://www.flickr.com/photos/81838529@N00/525129498).'
# thumbnail: 'thumbnail.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

series: # Creates lists of posts in series as well as custom tag.

categories:
  - web development
tags:
  - Hugo
  - Bash scripting
keywords: # Extra keywords in addition to the above, for SEO.

# Archive taxonomy terms (auto-generated)
year: '2022'
month: '2022-10'
---

One of the foundational ideas for the [Hugo](https://gohugo.io/) static site
generator, in which this site is built, is flexibility.

Consequently, that means a lot of aspects of how a site is built is left to the
developer, rather than creating tools within Hugo.

One frequently-requested system that doesn't exist natively within Hugo is a
date-based archive of posts. Many blogging systems (most notably WordPress)
feature these kinds of archives prominently, and many writers and readers expect
something like that to be available. It's
[being considered for Hugo](https://github.com/gohugoio/hugo/issues/448), sort
of (there hasn't been any progress in 4&frac12; years).

But that issue I linked to outlines one option to handle this manually: Using
taxonomies.
