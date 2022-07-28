---
title:
  'Two-click button foils Facebook tracking, a new tool for privacy-concerned
  nonprofits'
author: ivan
date: '2011-09-06'
# lastmod: '2022-07-12' # Appends 'edited on' to the publish date

slug: 'two-click-button-foils-facebook-tracking-new-tool-privacy-concerned-nonprofits' # Recommended length is 3 to 5 words.
aliases:
  - /p/110906

# For the post as it appears in lists.
summary: >
  Organizations concerned about the privacy of their visitors should carefully
  weigh whether a given social widget is worth the risk in privacy. Moreover,
  these organizations should absolutely provide a privacy policy that
  specifically lays out what's being collected and by whom, and may also want to
  consider suggesting ways for those at risk to circumvent this data tracking.

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Organizations concerned about the privacy of their visitors should carefully
  weigh whether a given social widget is worth the risk in privacy.

draft: false # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'security-camera_flickr-therontrowbridge.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'A security camera' # Alternative text for featured image.
featureImageCreditFlickr: 'therontrowbridge'
# featureImageCreditCustom: 'Top image credit Flickr user [username](https://www.flickr.com/photos/username).'
thumbnail: 'security-camera_flickr-therontrowbridge.jpg' # Image in lists of posts.
# shareImage: 'share.jpg Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - nonprofit technology
  - social media
tags:
  - Facebook
  - Google Plus
  - Twitter
  - privacy
keywords: # Extra keywords in addition to the above, for SEO.

# Archive taxonomy terms (auto-generated)
year: '2011'
month: '2011-09'
---

Last month, the privacy commissioner for the German state Schleswig-Holstein,
Thilo Weichert, announced that he would
[fine websites in his state €50,000 if they included Facebook's "Like" button](https://www.dw.com/en/german-privacy-watchdog-declares-facebooks-like-button-illegal/a-15331909).

> Weichert argues that this popular function breaches privacy by making it
> possible for the social networking giant to guess user preferences and
> opinions by compiling a profile of all the sites marked on one computer.

The issue is that **even if you don't click the "Like" button, Facebook still
knows you visited the page** because its server gets called to display the
button code. For individuals already on Facebook, it can compile a detailed
profile of you around the web, based on what you visit (again, whether or not
you click the button) and serve you or your friends particular ads on Facebook
as a result. For those who are not on Facebook, or who aren't logged in, it can
still tie the profile to your IP address, and could theoretically link that
information to you, should you subsequently show up on Facebook.

### This isn't unique to Facebook

Most "free" third-party apps do exactly the same thing, although few have the
reach of Facebook. The other big player is **Google**, who tracks you (by IP
address) using Google Analytics, which many websites have installed in exchange
for free website statistics, and tracks you (by Google profile) using Google's
new "+1" button released as part of the Google Plus social network. Since Google
makes so much of its money from advertising, its interest in knowing which sites
you visit is pretty self-explanatory.

Other social networks' widgets, such as Twitter's "Tweet" button, the Pinterest
button, etc. also are certainly tracking who is accessing them, but to date
there have been fewer examples of them using this information to build profiles
of people. Social "plugin" applications, like AddThis, ShareThis and Disqus also
compile profiles of people as a way to present them what they think will be the
most useful social network buttons (and in some cases links to other content),
but it's less clear whether they've been using that information for any other
purposes.

Organizations concerned about the privacy of their visitors -- **especially
those at risk of being tracked by repressive governments who could lean on
social networking companies to release user data** -- should carefully weigh
whether a given social widget is worth the risk in privacy. Moreover, these
organizations should absolutely provide a privacy policy that specifically lays
out what's being collected and by whom, and may also want to consider suggesting
ways for those at risk to circumvent this data tracking.

Several organizations I've seen have prominently linked to the
[Tor Project](https://www.torproject.org/), and there are good resources from
the [EFF](https://www.eff.org/wp/blog-safely) and
[Ethan Zuckerman](https://web.archive.org/web/20150910225919/https://ethanzuckerman.com/2006/10/01/anonymous-blogging-with-wordpress-and-tor/)
on using Tor for anonymous blogging. There are also
[several](https://addons.mozilla.org/en-US/firefox/addon/noscript/)
[Firefox](https://web.archive.org/web/20150910225919/https://addons.mozilla.org/en-US/firefox/addon/betterprivacy/)
[plugins](https://addons.mozilla.org/en-US/firefox/addon/ghostery/) that
anonymize your browsing. Any of these methods would defeat tracking by social
networking widgets.

### A two-click solution for websites

For organizations that want to ensure their users are only tracked by social
networking websites if they explicitly opt-in, there's an exciting new
development.

**Last week, as a response to the German privacy commissioner's declaration
against social networking buttons, German website Heise has
[released a script](https://www.heise.de/extras/socialshareprivacy/) that
disables social networking buttons by default.**

![Two-click social networking buttons: Off by default, and turned on.](two-click-sns-buttons.png 'The two stages of the social networking buttons (each operates independently). Note the Facebook button is localized in German.')

The script renders three social networking buttons -- Facebook's Like, Google's
+1 and Twitter's Tweet -- as greyed-out images hosted locally on the website.
After flicking a virtual switch, site visitors enable the actual social
networking button, which calls the web servers of Facebook, Google or Twitter
and would thus trigger the data collection. There's also a handy settings button
to the right, that allows you to permanently opt-in to one or all of the
services for that site. You can
[see it in use](https://web.archive.org/web/20150910225919/http://www.heise.de/newsticker/meldung/Facebook-beschwert-sich-ueber-datenschutzfreundlichen-2-Klick-Button-2-Update-1335658.html)
at the bottom of the post where they announce it.
