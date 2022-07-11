---
title: 'Grow your own: Learning custom base themes at Drupalcon Portland'
author: Ivan Boothe
date: '2013-05-15'
# lastmod: 2022-07-09 # Appends 'edited on' to the publish date

slug: 'grow-your-own-learning-custom-base-themes-drupalcon-portland' # Recommended length is 3 to 5 words.
aliases:
  - /p/130515
description: "By necessity, base themes make assumptions about how teams and
  individuals work. By rolling your own, you'll become much more comfortable and
  informed about the Drupal theming layer, and have a better launchpad for your
  front-end projects." # For SEO and social media snippets.
summary: '“By necessity, base themes make assumptions about how teams and
  individuals work. By rolling your own, you’ll become much more comfortable and
  informed about the Drupal theming layer, and have a better launchpad for your
  front-end projects.”' # For the post in lists.

draft: false # Change to 'false' to publish this post.
featured: true
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'growyourown-themes.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
# featureImageAlt: 'Description of image' # Alternative text for featured image.
# featureImageCreditFlickr: 'username'
featureImageCreditCustom:
  'Top images: [National
  Archives](https://commons.wikimedia.org/wiki/File:%22Grow_Your_Own_Be_Sure%22_-_NARA_-_513660.jpg)
  and Flickr user [McBeth](https://www.flickr.com/photos/mcbeth/23877066).'
thumbnail: 'growyourown-themes.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - frontend development
tags:
  - Drupal
keywords: # For SEO. Generally a combination of categories and tags.
  - frontend
  - Drupal

# Archive taxonomy terms (auto-generated)
year: '2013'
month: '2013-05'
---

**Ah, base themes.**

If there’s an analogue to the Windows/Mac/Linux battle in Drupal land, it’s
probably [Zen](https://www.drupal.org/project/zen) vs.
[Omega](https://www.drupal.org/project/omega) vs.
[AdaptiveTheme](https://www.drupal.org/project/adaptivetheme).

**Garrett Dawson** and **John Ferris** have a way out of that eternal struggle:
Custom base themes. As they put it in their
[Drupalcon Portland session description](https://portland2013.drupal.org/node/3043.html):

> “By necessity, base themes make assumptions about how teams and individuals
> work. By rolling your own, you’ll become much more comfortable and informed
> about the Drupal theming layer, and have a better launchpad for your
> front-end projects.”

Here in Portland we take home gardening and
[permaculture](https://en.wikipedia.org/wiki/Permaculture) seriously, so what
better place to talk about “growing your own” custom base theme!

I spoke with John and Garrett about how creating your own base theme can make
work for you and your team easier.
[**Take a gander at their session, “Dapper Drupal: Custom Tailored Themes,” on Thursday at 2:15 PM for the full story!**](https://portland2013.drupal.org/node/3043.html)

---

**IB: Base themes that are out there make some assumptions about how you want to
theme. What’s the advantage to rolling your own base theme rather than finding
the theme that already makes the assumptions you do?**

JF and GD: If you can find a base theme in contrib that fits perfectly into your
workflow, by all means, use it. There’s a lot of solid tools out there. We don’t
want to deter people from using and contributing to them. With that said, we
feel it’s unlikely a contributed base theme will be ticking all the boxes and
making all the right assumptions about your workflow.

There’s no one-size-fits-all approach. Your front-end process is heavily
influenced by team dynamics, contrib module choices and a whole host of other
considerations. The majority of base themes cannot account for those variables
like you can. We want front-end developers to take a critical look at their
tools to see where they can make improvements. That may mean creating a custom
base theme; a custom starter theme for use with an existing base theme; or even
a set of helper modules.

All the popular base themes started because someone wasn’t happy with what was
available at the time. The ultimate goal is increasing efficiency while
improving the quality of the final HTML, CSS and JS.

**IB: Do you recommend custom base themes for big shops? Small distributed
teams? Freelancers? Everyone?**

JF/GD: Yes, all of the above. At least consider it as an option. If you find
yourself doing any kind of repetitive work, there’s an opportunity for
improvement. The only people who should steer clear of custom base themes are
those new to Drupal. You need to be familiar with the tools that are available
before setting out to create your own.

**IB: Besides your the custom base themes you developed yourselves
([Center](https://www.drupal.org/project/center) and
[Prototype](https://www.drupal.org/project/prototype)) what other custom base
themes have you seen in the wild?**

JF/GD: Yes! We’ve learned a lot working with and iterating on Center and
Prototype. They work well for the structure of our team and the type of work we
do at [Aten](https://atendesigngroup.com/). However, we realize every team is
unique. We were really interested in seeing how other organizations were
approaching the front-end problem space. We chatted with a range of teams of
varying sizes working across different industries. Everyone has their own unique
set of tools based on their own strengths and constraints. We’re excited to
share those with you, but you’ll just have to come and see for yourself!
