---
title: 'Community blogs run better on open-source software'
author: Ivan Boothe
date: '2009-01-20'
# lastmod: '2022-07-14' # Appends 'edited on' to the publish date

slug: 'community-blogs-run-better-open-source-software' # Recommended length is 3 to 5 words.
aliases:
  - /p/090120

# For the post as it appears in lists.
summary: >
  Even if Bryght/Acquia/May First went out of business tomorrow, virtually all
  of its customers could find another vendor to take their system completely
  intact and get them up and running in an hour or two.

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Even if Bryght/Acquia/May First went out of business tomorrow, virtually all
  of its customers could find another vendor to take their system completely
  intact.

draft: false # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'open-person_flickr-opensourceway.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'Open source' # Alternative text for featured image.
featureImageCreditFlickr: 'opensourceway'
# featureImageCreditCustom: 'Top image credit Flickr user [username](https://www.flickr.com/photos/username).'
thumbnail: 'open-person_flickr-opensourceway.jpg' # Image in lists of posts.
# shareImage: 'share.jpg Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - open source
  - nonprofit technology
tags:
  - community
  - Drupal
  - WordPress
keywords: # Extra keywords in addition to the above, for SEO.
  -

# Archive taxonomy terms (auto-generated)
year: '2009'
month: '2009-01'
---

Earlier this month,
[Soapblox](https://web.archive.org/web/20090119044552/http://www.soapblox.net/blog),
a blogging platform used by many local progressive bloggers -- especially
community blogs --
[collapsed](https://www.dailykos.com/stories/2009/01/07/681153/-Soapblox-sites-hacked-Info-gathering-thread 'Read the original report on Daily Kos').
In one fell swoop, hundreds of political activists' online communities were
gone, despite the fact that they had been paying for the service.

Why did one system failure take down such a large network? Because the entire
project was being
[run by one person](https://web.archive.org/web/20130116145605/http://www.https://www.dailykos.com/stories/2009/01/07/681191/-Why-SoapBlox-Matters 'Read about the setup, as described on Daily Kos'),
part-time. These were fairly high-traffic blogs, yet their content was hosted on
Soapblox's own servers, and when it all went down, that data became unavailable.
After first proclaiming the software "dead," developer Paul Preston responded to
an outpouring of community support and donations by working to restore the
service.

On many lists and other community blogs, discussions have centered on whether it
makes sense for these blogs to stay on Soapblox. "The consensus that appears to
have emerged after a fairly short but very wide-ranging discussion is: it may
make sense to transition to another system eventually; for now there is no
readily available alternative,"
[wrote Shai Sachs at MyDD](https://web.archive.org/web/20120705053736/http://mydd.com/2009/1/10/soapblox-meltdown-and-drupal "Read 'Soapblox meltdown and Drupal' on MyDD").

Most of those discussions then devolve into "[Drupal](https://www.drupal.org/)!
No, [WordPress](https://www.wordpress.org/)!" with proponents of each sparring
over how to construct a community blog similar to Soapblox's core features. I
want to refocus the discussion around the underlying issue: **Community blogs
simply run better on open-source software, regardless of the platform.**

Of course, it's true that different systems have different features, and one of
the attractions of Soapblox was that it offered just want community-blog sites
needed out of the box. Setting up community blogs on Drupal or WordPress, both
of which I have pretty extensive experience with, is definitely possible, but
each requires customization -- something many local activists don't have time or
money to do.

There [are](https://www.acquia.com/ 'Acquia')
[many](https://mayfirst.coop 'May First/People Link')
[companies](https://web.archive.org/web/20090119040137/http://bryght.com/ 'Bryght')
that offer "hosted" versions of open-source software, in the same way that
Soapblox (the company) offered a hosted version of Soapblox (the software). So
why would I recommend the open-source hosts?

The issue here -- and the difference between these open-source hosts and
Soapblox -- is the **gigantic community of open-source developers behind them**.
Soapblox, like these other companies, helps set up hosting and put a friendly
face on a somewhat complicated piece of software. But there are hundreds of
people working on Drupal that aren't in any way connected to Bryght, or Acquia,
or May First -- and that's something that all of their customers benefit from:
new features, continually-upgraded plugins and security fixes.

With a proprietary system, you get only what the company chooses to put out, and
only what they have time to put out. Paul has since
[suggested](https://web.archive.org/web/20081229235918/http://www.soapblox.net:80/blog/showDiary.do?diaryId=2 "Read 'Where we stand' on the Soapblox blog")
that "SoapBlox needs to be transformed from a proprietary model to one of open
source to help get rid of me alone as the single-point of contact with so much
stuff."

I think that's great, and if Soapblox becomes an open-source project then I'd
definitely recommend it along with other open-source platforms. But the point
isn't just to make Paul's life easier, or make him more responsive to customers.
**Open-sourcing Soapblox would make the software, and the blogs it hosts,
better.** Don't believe me? _Information Week_ magazine wrote a
[cover story](https://www.informationweek.com/operating-systems/collaboration-is-at-the-heart-of-open-source-content-management "Read 'Collaboration Is At The Heart Of Open Source Content Management' from Information Week")
about how businesses are using Drupal and other open-source software, and why:

> Drupal draws on a strength that's common to other successful open source
> efforts: a vibrant community that drives innovation and lets companies tap the
> development efforts of thousands of people experimenting with the system.

Since reviving itself, Soapblox has hired some more people, and that's nice, I'm
sure, for both Paul and his customers. But the model by which we pay more and
more people to maintain our vitally-important software in locked cages just
seems poor to me.

**Even if Bryght/Acquia/May First went out of business tomorrow, virtually all
of its customers could find another vendor to take their system completely
intact and get them up and running in an hour or two.** Soapblox dies, and their
customers are stuck in the dark -- if they're lucky they might be able to get a
dump of the database and then painstakingly input it into another system.

Open-source communities as the scaffolding for community blogs just seems like a
no-brainer to me. I certainly understand the limited time people have and the
inertia around a system you already know, but I would hope this might serve as a
wake-up call to explore more robust and sustainable systems, be it Drupal or
WordPress, Joomla or Plone -- or, if Soapblox takes that route, Soapblox itself.
