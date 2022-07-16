---
title: 'Drupal for nonprofits, or, how to build social networks for change'
author: Ivan Boothe
date: '2008-01-01'
# lastmod: '2022-07-16' # Appends 'edited on' to the publish date

slug: 'drupal-nonprofits-how-build-social-networks-change' # Recommended length is 3 to 5 words.
aliases:
  - '/p/080101'
description: "In return for NetSquared's generosity, I wanted to post some tips
  for nonprofits thinking about using Drupal for their sites -- when to use it
  and when not to use it, as well as a few useful tidbits from a recent
  workshop." # For SEO and social media snippets.
summary: "In return for NetSquared's generosity, I wanted to post some tips for
  nonprofits thinking about using Drupal for their sites -- when to use it and
  when not to use it, as well as a few useful tidbits from a recent workshop." # For the post in lists.

draft: true # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'drupal-warhol_flickr-morten_dk.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'Drupal' # Alternative text for featured image.
featureImageCreditFlickr: 'morten.dk'
# featureImageCreditCustom: 'Top image credit Flickr user [username](https://www.flickr.com/photos/username).'
thumbnail: 'drupal-wallpaper_flickr-matt_farina.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - nonprofit technology
tags:
  - Drupal
keywords: # For SEO. Generally a combination of categories and tags.
  - nonprofit technology
  - nptech
  - Drupal

# Archive taxonomy terms (auto-generated)
year: '2008'
month: '2008-01'
---

(Cross-posted to
[NetSquared](https://web.archive.org/web/20160803034413/http://www.netsquared.org/blog/quixotic/drupal-nonprofits-or-how-build-social-networks-change))

Earlier this month, NetSquared was generous enough to fund my attendance at the
[Lullabot Drupal Intensive](https://web.archive.org/web/20160803034413/http://www.lullabot.com/workshop/both-fall-workshops/providence-ri-2007)
workshop in Providence, Rhode Island.
[Drupal](https://web.archive.org/web/20160803034413/http://www.drupal.org/) is a
free, open-source content management system that allows non-technical users to
update your site and is capable of powering blogs, community sites,
action-oriented campaigns and social networks along the lines of
[MySpace](https://web.archive.org/web/20160803034413/http://rootwork.org/category/tags/myspace)
and
[Facebook](https://web.archive.org/web/20160803034413/http://rootwork.org/category/tags/facebook).
Lullabot, a Drupal development firm that involved in much of the Drupal
development, has a
[keen interest in Drupal for nonprofits](https://web.archive.org/web/20160803034413/http://www.lullabot.com/articles/how_drupal_will_save_world).

In return for NetSquared’s generosity, I wanted to post some tips for nonprofits
thinking about using Drupal for their sites. I’m convinced that, under most
circumstances, Drupal can be a powerful resource for online advocacy and
social change.

### Background

To date, I have built four full-fledged sites with Drupal for the
[Genocide Intervention Network](https://web.archive.org/web/20160803034413/http://www.genocideintervention.net/):
[Ask the Candidates](https://web.archive.org/web/20160803034413/http://www.askthecandidates.org/)
(Drupal version 5), the
[Darfur Congressional Scorecard](https://web.archive.org/web/20160803034413/http://www.darfurscores.org/)
(v4.7), Time to Protect (v4.7, no longer online) and Power to Protect (v4.6, no
longer online). GI\-Net’s
[main site](https://web.archive.org/web/20160803034413/http://www.genocideintervention.net/)
was also developed in Drupal (v4.7) by an outside firm, as was GI\-Net’s student
site,
[STAND](https://web.archive.org/web/20160803034413/http://www.standnow.org/)
(v4.7). My
[personal site](https://web.archive.org/web/20160803034413/http://www.quixoticlife.net/)
is in Drupal (v5) and I’m working on releasing an e-commerce site and a
community events site in the near future.

Although I have a working knowledge of basic PHP, on which Drupal is based, my
work primarily is in HTML and CSS — for the majority of things our sites need to
do, it’s mainly a matter of finding the right modules (plugins) and then
themeing (designing) the site to look the way we want. By and large you don’t
need to have a lot of programming knowledge to create effective sites in Drupal.

### When to Use Drupal — and When Not to Use it

Drupal has a number of strengths:

- Once you understand the terminology and basic structure of Drupal, it’s easy
  to set up sites relatively quickly, with advanced functionality simply
  “dropped in” by way of modules.
- Drupal is relatively easy to theme, especially in version 5 and even more so
  in the upcoming version 6 (likely to be released in early 2008).
- Drupal is extremely search-engine friendly, helping get your site to the top
  of search engine lists with minimal effort. With a few tweaks and additional
  modules, it can be even more effective.
- Drupal is relatively scalable, able to power large sites as well as small. For
  very high-traffic sites, this will take some tweaking of the server settings,
  but this is true for pretty much any content management system (CMS).
- It’s free! More importantly, it has a large, robust community of developers
  regularly updating both its core features and plug-in modules — also for free!
  And when you can’t swing the free-software cost — staff time — there are
  plenty of
  [Drupal developers](https://web.archive.org/web/20160803034413/http://drupal.org/drupal-services)
  out there. For nonprofits looking to “act out” social change, Drupal is a
  welcome addition to for-profit corporations upon which you have to depend for
  any updates or bug fixes.
- Because it’s open-source, Drupal won’t lock you in to a proprietary system
  that mangles your data or makes it difficult to switch to another CMS in the
  future. Additionally, it’s open nature allows for more frequent integration
  with other software and web services — everything from
  [Flickr](https://web.archive.org/web/20160803034413/http://www.flickr.com/) to
  [Salesforce](https://web.archive.org/web/20160803034413/http://www.salesforce.com/),
  with rumors of
  [Democracy in Action](https://web.archive.org/web/20160803034413/http://www2.democracyinaction.org/)
  on the way.
- Of special note, Drupal has tight integration with
  [CiviCRM](https://web.archive.org/web/20160803034413/http://civicrm.org/) and
  equally free, open-source contact relationship manager (also available for the
  Joomla CMS). If you opt to use CiviCRM as your CRM for donors or members, you
  can aggregate useful data like donations through the website, membership dues,
  attendance at events, subscriptions to mailing lists and participation in
  local groups, as well as the usual searching, sorting and categorizing of
  contacts available in any CRM.
- For you geeks out there, it uses standards compliant (at least in core)
  semantic code and is built on the
  [MVC](https://web.archive.org/web/20160803034413/http://en.wikipedia.org/wiki/Model-view-controller) model.

Many prominent sites, both commercial and nonprofit, have been built on Drupal,
including
[MTV.co.uk](https://web.archive.org/web/20160803034413/http://www.mtv.co.uk/),
[Sen. Chris Dodd](https://web.archive.org/web/20160803034413/http://dodd.senate.gov/),
[The Onion](https://web.archive.org/web/20160803034413/http://www.theonion.com/)
and NetSquared itself
([see a full list](https://web.archive.org/web/20160803034413/http://www.netsquared.org/)).
One of my favorites, just recently released, is WITNESS’s
[The Hub](https://web.archive.org/web/20160803034413/http://hub.witness.org/),
built by the fine folks at
[CivicActions](https://web.archive.org/web/20160803034413/http://www.civicactions.com/).
(The Hub was also a
[proposal](https://web.archive.org/web/20160803034413/http://www.netsquared.org/projects/proposals/hub)
for the 2007 NetSquared Conference.) I think The Hub really shows the potential
for social change that Drupal-powered sites can accomplish.

When might you not want to use Drupal?

- For those completely new to Drupal, it can have a significant learning curve.
  We’re not talking Photoshop here, but much of the terminology and structure of
  the site can be unfamiliar to new users, even those familiar with other CMSes.
  If you need a hot website tomorrow and can’t spring for a paid developer, it
  might make more sense to go with a CMS you already know.
- Drupal is an excellent platform for blogs, and allows you to build in a lot of
  community and social-networking features that can strengthen your blog’s
  appeal. However,
  [WordPress](https://web.archive.org/web/20160803034413/http://wordpress.org/),
  another free open-source software, is specifically oriented toward blogs. The
  learning curve is significantly less, and it’s somewhat easier to theme
  (design). If you’re primarily a designer and you want a straightforward blog
  site without having to ever see a line of PHP code, WordPress may well be a
  better option. Like Drupal, it has an excellent community of developers and
  contributers, and many of its plugins can also stretch its capabilities to
  encompass social-networking-oriented functions.
- If you absolutely need a website tomorrow — a simple blog or “brochureware”
  site giving the basics of a new campaign and a place to post updates and press
  releases, your best bet may be
  [Joomla](https://web.archive.org/web/20160803034413/http://www.joomla.org/).
  Like Drupal and WordPress, it’s free, open-source and has lots of developers,
  many of them involved in nonprofits and advocacy campaigns. It is somewhat
  harder to design to not look like “a Joomla site” but there’s no question that
  it’s faster to set up and publish a simple website.
- Free software is great and all, but if you have no budget and no design or
  programming resources in-house, you may want to stick with that commercial CMS
  you know — or even Dreamweaver or FrontPage sites. The cost of free software
  is the development time, and that isn’t an insignificant concern. If you’re
  planning a big campaign and have a budget or in-house developers, I highly
  recommend one of the open-source CMSes because of all of the strengths
  mentioned above (and particularly that they won’t lock you into some horrible
  proprietary code nightmare). But not every nonprofit will have that luxury,
  and you should carefully consider if you have the money or staff time to build
  a site from scratch.
- Above, I mentioned that many Drupal modules offer integration with other
  software and web services. This is true, but not for every piece of software
  out there, and not always as robustly as you might like. In particular, if you
  have a lot of tight integration needs and already have another piece hosted
  with another service — a donor database or an online action suite, for
  instance — it may make sense to build your website using their own CMS to
  allow for the tightest possible integration. You’ll give up some of the cool
  Drupal functionality and customization possibilities, but when it comes time
  to run those end-year reports, you just push a button.
- Drupal is built by volunteers. Some of them are paid web developers who
  voluntarily contribute their work back to the Drupal community. But nothing is
  guaranteed — that module you depend on might have a bug that doesn’t get fixed
  for six months. There are ways to help guard against this — for instance, by
  sticking to modules
  [recommended](https://web.archive.org/web/20160803034413/http://www.lullabot.com/audiocast/drupal_podcast_no_40_top_40_projects)
  by
  [others](https://web.archive.org/web/20160803034413/http://webpodge.com/2007/02/22/top-10-drupal-modules/),
  and checking to see how often past releases have come out, but it’s definitely
  something to consider. In all of the sites I’ve built Drupal on, only one
  mission-critical item has ever had a serious bug that took a couple of months
  to get addressed. That said, if you do have developers on hand or can pay
  others, Drupal’s open-source nature makes it easy to find and squash the bugs
  yourself as they occur — no waiting on Kintera or Convio to get around to
  fixing your pet peeve with the software.

### Drupal Resources for Nonprofits

[Drupal for Good](https://web.archive.org/web/20160803034413/http://groups.drupal.org/drupal-for-good)
is the primary Drupal-centered site for nonprofit and charitable discussions.
(For the mischievous, there’s also
[Drupal for Evil](https://web.archive.org/web/20160803034413/http://groups.drupal.org/drupal-for-evil).)
There are plenty of
[geographically-based Drupal groups](https://web.archive.org/web/20160803034413/http://tinyurl.com/35g76u)
— see if there’s one near you!

There’s lots of general Drupal support out there, including the
[handbook documentation](https://web.archive.org/web/20160803034413/http://drupal.org/handbooks),
[mailing lists](https://web.archive.org/web/20160803034413/http://drupal.org/handbooks),
[IRC](https://web.archive.org/web/20160803034413/http://drupal.org/node/108355),
[forums](https://web.archive.org/web/20160803034413/http://drupal.org/forum) and
[blogs](https://web.archive.org/web/20160803034413/http://drupal.org/planet).
(If you have questions about a specific module, the best practice is to go to
that module’s project page on Drupal and post an issue — among other things,
it’s far more likely your questions or concerns will be answered than if you
post on the general forums!) There are also
[books on Drupal](https://web.archive.org/web/20160803034413/http://drupal.org/node/42200)
as well as fee-based training from groups like
[Lullabot](https://web.archive.org/web/20160803034413/http://www.lullabot.com/training).

Want even more? Try the weekly
[Lullabot Podcast](https://web.archive.org/web/20160803034413/http://www.lullabot.com/podcast)
or browse through the step-by-step
[Drupal Dojo screencasts](https://web.archive.org/web/20160803034413/http://www.drupaldojo.com/).
One of Drupal’s strengths is its vibrant community!

I’ll be posting more about how Drupal can be useful to nonprofits — including
case studies — in the near future. If you have any comments or suggestions for
resources, please add them in the comments!
