---
title:
  'Drupal 8, aural interfaces and groundbreaking accessibility at Drupalcon
  Portland'
author: Ivan Boothe
date: '2013-05-16'
# lastmod: 2022-07-09 # Appends 'edited on' to the publish date

slug: 'drupal-8-aural-interfaces-groundbreaking-accessibility-drupalcon-portland' # Recommended length is 3 to 5 words.
aliases:
  - /p/130516a
description: 'Drupal is getting a switchboard operator. Module developers will
  be able to pass a string to a method called "announce" on the Drupal object
  and have that string read by a screen reader.' # For SEO and social media snippets.
summary: 'Drupal is getting a switchboard operator. Module developers will be
  able to pass a string to a method called "announce" on the Drupal object and
  have that string read by a screen reader.' # For the post in lists.

draft: false # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'switchboard-publicdomain.jpg' # Top image on post.
featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'A switchboard operator for Drupal?' # Alternative text for featured image.
# featureImageCreditFlickr: 'username'
featureImageCreditCustom: 'Top image: Public domain.'
thumbnail: 'switchboard-publicdomain.jpg' # Image in lists of posts.
# shareImage: 'share.jpg' # For SEO and social media snippets. Falls back to thumbnail (if set) or featureImage.

codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: false # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.

categories:
  - frontend development
  - accessibility
tags:
  - Drupal
keywords: # For SEO. Generally a combination of categories and tags.
  - frontend
  - Drupal
  - a11y
  - accessibility

# Archive taxonomy terms (auto-generated)
year: '2013'
month: '2013-05'
---

I’m a millennial, but even I remember the experience of calling the telephone
operator and getting a live human to look up the number of a business or place a
collect call. We have the digital means to complete lots of tasks like that
today, but that doesn’t mean all of our methods are equally effective for
everyone.

![Drupal's new mobile-friendly toolbar ::legacy-float-r](mobile-friendly-toolbar.png ' ')“Drupal
8 will be the most accessible version of Drupal yet,” declare **J. Renée Beach**
and **Wim Leers** in their
[Drupalcon Portland session description](https://portland2013.drupal.org/node/2158.html).

They’re both part of the [Spark team](https://www.drupal.org/project/spark), an
initiative to improve the authoring experience in Drupal for everyone.

Spark is more well known for things like
[in-place editing](https://www.drupal.org/project/quickedit) and a
[mobile friendly toolbar](https://www.drupal.org/project/navbar), (see image).
But from the beginning, improving the experience for everyone has been a big
priority, and one of the most exciting developments is a new aural interface.

**That’s right, Drupal is getting a switchboard operator:**

![Drupal announce log showing three “polite Drupal announcements”](drupal-announce-log.png)

OK, so that doesn’t look _terribly_ exciting all on its own. But trust me, when
you watch the videos of people interacting with Drupal 8 and having menus and
selections read as they go, it’s pretty cool.

When I spoke with J. Renée about Drupal 8 and the nature of working on
accessibility, the passion for this work really shown through. I’m really
looking forward to their session with Wim,
[**“Drupal Speaks: Aural user interfaces, new Drupal 8 accessibility features,” on Wednesday at 10:45 AM.**](https://portland2013.drupal.org/node/2158.html)
Hope to see you there!

---

**IB: What are we missing when we talk about accessibility right now?**

JRB: I want developers to understand that accessibility is fundamental to user
interface development. We tend to talk about accessibility like we talk about
gender. Both have coded values. When we speak of being gendered, we are often
talking about being non-male. Male is a kind of genderless base state. So is it
with accessibility. When we speak of making something accessible, we tend to
refer to making an interface for blind users or for users with physical
capabilities that make keyboard and mouse use difficult, as examples. Visual is
a kind of accessible base state.

We risk “othering” folks for whom accessibility is an issue because as
developers, in general, non-visual accessibility has not been a primary concern.
I know what is is like to be othered. In some ways, highlighting otherness can
be an effective way to bring focus to a problem. Eventually though, we need to
resolve those issues and close the loop on the otherness. We can be other and
also be equal. Now is the time for front end developers to start thinking about
accessibility as a multi-modal effort. We no longer have the excuse that the
tools and technologies available to us do not support efficient workflows for
non-visual UI development.

**IB: Where is Drupal 8 going to do better?**

JRB: Most importantly, we have more individual core contributors this cycle who
truly believe in addressing accessibility issues. And they are all smart,
wonderful people which makes working with them a pleasure!

For example, take
[this issue about requirement warnings during installation](https://drupal.org/node/1811128).
For a sighted user, a warning during installation is immediately apparent. The
missing requirement is made distinct with color contrast. For a blind user, they
must traverse every cell in the table to discover a missing requirement. Would
we ever impose such a burden on a sight user through the UI? No, not without
grumbles in the issue queues at least. With more contributors invested in
improving these types of non-visual details, we are polishing all the rough
edges — the ones we see _and_ the ones we don’t.

**IB: How important is context in aural interfaces?**

JRB: Context is important to all interfaces. As front end developers we build
templates that expose context in a predictable, consumable way. As a practice we
have established and then refined patterns of visual expression over the past
30-plus years.

Metaphors grounded visual pointer displays on a virtual desktop. We talk of
visual affordances in rounded, gradient-embellished, reflective buttons.
[Skeumorphic designs](https://en.wikipedia.org/wiki/Skeuomorph) bring our
understanding of the physical world to bear on pixels and bits.

Where are the metaphors in aural interface design? I know of none. To me, these
interfaces are flat. The metal is bare underneath them.

Perhaps non-visual interfaces have one less level of abstraction to traverse.
Maybe there’s no need to translate language into symbol and then back into
language. But that little bit of designer in me, that memory of a linguist I
almost was, remembers being thunderstruck with insight reading
[Jackendoff’s](https://en.wikipedia.org/wiki/Ray_Jackendoff) unfurling of
metaphor after I had just so recently fallen smitten with the strict generative
grammar of early
[Chomsky](https://en.wikipedia.org/wiki/Noam_Chomsky#Linguistic_theory).
Jackendoff gives us a way of understanding language that starts at basic
physical dichotomies — up/down and near/far — and from there offers us a model
of communication. He gives us pattern. (Early) Chomsky gave us metal. So much
that we humans do starts with structure that softens with time to fit our curvy,
winding nature.

I want to believe that the aural interfaces we have today still just the awkward
first attempts to build an abstract audio interface pattern language. That
non-visual interface design is still working through its
[structuralist](https://en.wikipedia.org/wiki/Structural_linguistics) phase. We
are still learning how to pack context into denser forms through non-visual
expressions.

**IB: Will the Drupal 8 improvements have things to offer module developers?**

JRB: In Drupal 8, we are building tools that manage a couple of the trickier
components of accessibility in a browser. These are:

1. Outputting audio updates

2. Managing tabbing in constrained workflows

Module developers will be able to pass a string to a method called
“**announce**” on the Drupal object and have that string read by a screen
reader.

Another method on the Drupal object called “**tabbingManager**” will constrain
tabbable elements on the page. A developer will select those elements, either
through JavaScript methods or jQuery, and pass them to the tabbingManager.
Tabbing is then constrained to those elements until the constraint is superseded
or released. I know that must not be completely clear, but that’s why we’re
presenting
[a session about aural user interfaces and how we can use these new tools to build them](https://portland2013.drupal.org/node/2158.html)!
