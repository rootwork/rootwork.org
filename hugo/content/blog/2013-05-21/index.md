---
title:
  'We need to talk about your stylesheets: An interview with Jonathan Snook at
  Drupalcon Portland'
author: ivan
date: '2013-05-21'
# lastmod: 2022-06-17 # Appends 'edited on' to the publish date

slug: 'we-need-talk-about-your-stylesheets-interview-jonathan-snook-drupalcon-portland' # Recommended length is 3 to 5 words.
aliases:
  - /p/130521

# For the post as it appears in lists.
summary: >
  SMACSS, or Scalable and Modular Architecture for CSS, was developed by
  Jonathan Snook, a featured speaker at Drupalcon Portland. I'm really excited
  to get the opportunity to have Jonathan speak, not only because of my
  personally well-dog-eared copy of SMACSS, but because Drupal itself is
  adopting a SMACSS approach to its CSS.

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  A Q&A with the author of SMACSS, or Scalable and Modular Architecture for CSS:
  Jonathan Snook, a featured speaker at Drupalcon Portland.

draft: false # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'spaghetti-light_flickr-stevensnodgrass.jpg' # Top image on post.
# featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'Backlit spaghetti (as in code)' # Alternative text for featured image.
featureImageCreditFlickr: 'stevensnodgrass'
# featureImageCreditCustom: 'Image credit Flickr user [username](https://www.flickr.com/photos/username).'
thumbnail: 'spaghetti-light_flickr-stevensnodgrass.jpg' # Image in lists of posts.
# shareImage: 'share.jpg

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - frontend development
tags:
  - CSS
  - Drupal
keywords: # Extra keywords in addition to the above, for SEO.
  - Sass
series: Drupalcon Portland 2013

# Archive taxonomy terms (auto-generated)
year: '2013'
month: '2013-05'
---

**This is an intervention.**

CSS is pretty simple. Classes, IDs, elements and pseudo-elements, with style
definitions attached to each. Calling it a "language" is a bit of a stretch
(though preprocessors like [Sass](https://sass-lang.com) fit the bill).

**But let's be honest, for years our stylesheets cascaded right on out to
infinity.**

Huge files with table-of-contents comments to try to make some sense of it --
until a quick fix got pasted down at the bottom. Brittle style definitions
relying on tight coupling with HTML structure. Pieces of styles being replicated
here and there for different components with similar features, without any way
to tell they were related in the CSS.

My stylesheets were like that too, because strategies for writing CSS had barely
altered since the days when it was used to change the colors of the scroll bars
in Internet Explorer. Luckily, in the past couple of years both
[CSS architecture and CSS preprocessors came into their own](/blog/2013/05/ninjas-your-code-drupalcon-portland-sass-extends-placeholders).

![Jonathan Snook ::legacy-float-r](jonathansnook.jpg ' ')**SMACSS**, or
[Scalable and Modular Architecture for CSS](http://smacss.com/), was developed
by **[Jonathan Snook](https://snook.ca/)**, a featured speaker at Drupalcon
Portland. I'm really excited to get the opportunity to have Jonathan speak, not
only because of my personally well-dog-eared copy of _SMACSS_, but because
Drupal itself is
[adopting a SMACSS approach](/blog/2013/05/world-class-frontend-track-drupalcon-portland)
to its CSS.

I spoke with Jonathan about sustainable stylesheets and the future of SMACSS.
For an even more detailed look,
[**please join me at Jonathan Snook's featured Drupalcon Portland this afternon, Tuesday, May 21 at 4:30 PM.**](https://portland2013.drupal.org/session/scalable-and-modular-architecture-css.html)

---

**IB: What's the biggest mistake you see people making when writing CSS?**

JS: I think the biggest mistake is thinking of everything in the context of a
single page. We're no longer just building sites with a design for a home page
and an inside page. We're developing complex systems that need to work in a
variety of contexts and we need a development approach that complements that.

[![SMACSS ::legacy-float-l](smacss-book.png ' ')](http://smacss.com/)**IB:
What's the biggest "win" you see in using the SMACSS approach? Why should
frontend developers change their approach to CSS?**

JS: The biggest win is maintainability. The SMACSS methodology makes it easier
to build larger projects by breaking things down into smaller components. Like
the move from spaghetti code to
[MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
frameworks on the server side, this separation of concerns on the CSS side
improves the process of putting a site or web app together.

**IB: In the last part of your book, you talk about how the SMACSS approach fits
in to work using a preprocessor like Sass. There have been a lot of developments
in Sass in the past year -- have they had any positive effects on your use of
the SMACSS approach?**

JS: With Sass, the introduction of placeholders was a positive step forward.
Overall, Sass (and other preprocessors) are a great way to augment -- but not
replace -- the way people write CSS.

**IB: What are your thoughts on [BEM](https://en.bem.info/)? Do you see it as
compatible with SMACSS?**

JS: I see BEM as very compatible. BEM really enforces naming convention, which
is a very important concept in SMACSS. They both take a modular approach to site
development.

**IB: What are you tacking next when it comes to CSS and frontend development?
Will there be a "SMACSS Part Two"? Or something else entirely?**

JS: I'd love to augment SMACSS with case studies and expand on some of the ideas
in the book based on things that come up in the workshops I do. I'd also like to
work on a prototyping/site development tool that uses the SMACSS concepts. We
had built something like this when I was at Yahoo! that I think many people in
the industry would find really useful. Hopefully I can find the time to work on
it!
