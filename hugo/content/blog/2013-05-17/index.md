---
title:
  'Drupalcon Portland: Responsive web design in a snap with Breakpoint and Sass'
author: Ivan Boothe
date: '2013-05-17'
# lastmod: 2022-06-21 # Appends 'edited on' to the publish date

slug: 'drupalcon-portland-responsive-web-design-snap-breakpoint-sass' # Recommended length is 3 to 5 words.
aliases:
  - /p/130517

# For the post as it appears in lists.
summary: >
  Media queries are a key part of responsive web design, because they control at
  what width (among other things) different CSS rules kick in. "Breakpoint makes
  writing media queries in Sass super simple," say Mason Wendell and Sam
  Richard, creators of the extension to Compass, and they're right. It's not
  surprising that we'd want them to present at Drupalcon, since design in
  Drupal, like web design everywhere, has been embracing responsive web design
  as a fundamental principle.

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Media queries are a key part of responsive web design, because they control at
  what width (among other things) different CSS rules kick in. Breakpoint makes
  them easy.

draft: false # Change to 'false' to publish this post.
featured: false
toc: false

showDate: true
showReadTime: true
showShare: true

# menu: main

featureImage: 'snap-squares_flickr-missnita.jpg' # Top image on post.
# featureImageShade: true # Add a translucent shade to the image to make overlaid text easier to read.
featureImageAlt: 'Artistic rendering of a person snapping' # Alternative text for featured image.
featureImageCreditFlickr: 'missnita'
# featureImageCreditCustom: 'Image credit Flickr user [username](https://www.flickr.com/photos/username).'
thumbnail: 'snap-squares_flickr-missnita.jpg' # Image in lists of posts.
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

# Archive taxonomy terms (auto-generated)
year: '2013'
month: '2013-05'
---

**Media queries** are a key part of responsive web design, because they control
at what width (among other things) different CSS rules kick in.

"[Breakpoint](http://breakpoint-sass.com/) makes writing media queries in Sass
super simple," say **Mason Wendell** and **Sam Richard**, creators of the
extension to [Compass](http://compass-style.org/), and they're right. It's not
surprising that we'd want them to present at Drupalcon, since design in Drupal,
like web design everywhere, has been embracing responsive web design as a
fundamental principle. (Side note: This website is in the midst of a responsive
web design overhaul. Cobbler's children and all that.)

I spoke to Mason and Sam about how Breakpoint makes responsive web design even
easier. Don't miss
**[their Drupalcon Portland frontend session, "Managing Responsive Web Design with Sass and Breakpoint," on Thursday at 10:45 AM](https://portland2013.drupal.org/session/managing-responsive-web-design-sass-and-breakpoint.html)**.

---

**IB: What motivated you to create Breakpoint? How has it changed your own
workflow?**

MW: Before Sass 3.2 came out I had written an article for The Sass Way that
previewed some of it's new features, including the ability to use variables in
media queries. I created an example that baked in some names for breakpoints
into a kind of "master mixin" for media queries. On my next responsive project I
put the theories I'd written for that post into practice, and found that I could
refine that approach. If I assigned a variable to each media query first the
approach would be very flexible. Then when noticed that I wrote min-width
queries way more often than any other type I set up defaults that made creating
media queries very fast.

MW: There was a side effect that I think is more useful though. By assigning
names to each of my media queries I'm able to keep them in context in a much
more effective way. If I some media queries to deal with the width of a nav
element, and then later I add an item to that nav, I can change the value of
that variable and all the associated queries are adjusted. This is even more
effective when handing code back and forth within a team.

SR: Breakpoint was created with the motivation to ease many of the pain points
of working with media queries in CSS. The biggest pain point that Breakpoint
solves is providing meaningful semantics to your media queries. When building
content based responsive sites, early in your design process two unrelated items
may happen to break at the same points, but as your project grows, those points
may change and a simple find and replace will have unintended consequences. This
is probably the biggest workflow win to using Breakpoint, all of your media
queries now have proper semantics.

SR: The other big win for my workflow is Breakpoint's
[no-query fallback](https://github.com/at-import/breakpoint/wiki/No-Query-Fallbacks),
allowing me to very easily add in fallback code for any of the media queries I
write.

**IB: What can Breakpoint do that just assigning variable names to specific
min-widths can't?**

SR: For starters, Breakpoint handles much more than min-width queries. It is
designed to be future friendly and currently supports all CSS level 3 and level
4 media queries. Additionally, it's syntax is easy to use to create complex
media queries, including both and and or media queries. It has native handling
for all of the different media query requirement for resolution (of which you
need to write at least four different queries for currently) while just writing
the standard. The no-query fallbacks are a huge win as well.

MW: The main benefit is that you can assign names and manage your media queries
with variables. This helps you avoid having them scattered around your SCSS, and
makes is easy to understand how they're related and affect each other.

MW: While Breakpoint is optimized for min-width because they're used most often
it doesn't stop there. There are a number of shortcuts built in, for fencing
min- and max- values, converting pixels to ems, and even vendor prefixed queries
like resolution.

MW: We even created a way to Breakpoint to report back to you what queries are
in a particular context.
[Singularity GS](https://github.com/at-import/Singularity) uses this feature to
kind of magically create responsive grid systems.

SR: Of all of Breakpoint's features, probably the least used, but most powerful
is
[Breakpoint Context](https://github.com/at-import/breakpoint/wiki/Breakpoint-Context).
This allows you to call a function anywhere and get the current media query
context allowing for amazingly intelligent mixins and functions to be written in
Sass, something unique to Breakpoint that you simply don't have with
interpolating variables.

**IB: Are there any responsive web design aspects specific to Drupal
theming/frontend development that Breakpoint helps with?**

SR: There is nothing Drupal specific that Breakpoint helps with. Breakpoint,
like Sass, was built to be backend independent. This means that if you are
building any site, regardless of if it's a Drupal site or a Node site or a
static site, Breakpoint is able to do its job handily without being caught up in
being tied to a specific backend technology.

MW: One of the things I love about working with Sass is that it's not
Drupal-specific, and it's meant to be used anywhere on the web. Breakpoint
follows that example.

**IB: Is Breakpoint a successor to
[Respond-To](https://github.com/snugug/respond-to), or will that continue to get
developed?**

SR: In a way, yes and no. Respond-To was written before Breakpoint, but upon
Breakpoint's release, it was decided that our efforts should be focused on a
unified Media Query engine, with Respond-To as a wrapper syntax for Breakpoint.
This is how the current Respond-To project exists. As of Breakpoint 2.0, the
Respond-To mixin has been incorporated into Breakpoint core, so you now can use
Respond-To without needing an additional Compass extension!

**IB: Do you use
[Breakpoints module](https://www.drupal.org/project/breakpoints) (in Drupal 8
core)? Or do you just do all of that through Sass?**

SR: I personally truly dislike the Breakpoint module. Every use case I've heard
for it seems to be based on the thinking that sites have three or four
breakpoints and that everything can be boiled down into an easy to use admin
interface. There are no standard breakpoints, period, and good, reasonably
complex responsive sites will usually have 20 or more breakpoints. Responsive
cannot be done from the backend, and the Breakpoint module encourages you to do
so (as does the
[Spark layout initiative](https://www.drupal.org/project/spark)).

**IB: Do you think any aspects of Breakpoint might get rolled directly into Sass
in the future?**

MW: It's possible, but we probably won't move the obvious parts to the Sass
language. There are some helper functions that we've written in Ruby that would
be very useful in Sass core. Once that's in we'll be able to offer Breakpoint
without Compass.

SR: I do not believe Breakpoint will be rolled directly into Sass, nor would I
want it to be, as it is out of scope of Sass core. As much as I like them, I
even think the color functions in Sass are out of scope for it. Sass core should
simply be the language and the bare minimum function base for it to be useable.
Sass doesn't ship with any mixins, and I think it should probably stay that way.
That being said, Breakpoint is fairly stable; our 1.3 release stood stable for
six or so months without needing any changes until we rewrote the whole thing
for our 2.x release, so maybe being merged into Compass isn't out of the
question, but I do not see a need for that.

**IB: I hear in addition to Breakpoint, Sam went and created some kind of magic
box of Sass called [Toolkit](https://github.com/at-import/toolkit). Want to say
more about that?**

SR: Toolkit started life as RWD Kickstart, a project Mason and I kind of made up
on the spot a year ago at one of the first New York Sass meetups. Its original
goal was simply to be a collection of Compass templates to make pulling in media
query and grid solutions together easily. Since then, it's evolved to be more of
a collection of Progressive Enhancement, Design in Browser, and Modern Web
Development tools, a toolkit if you'll let me, of useful tools. I'd say the four
biggest thing that Toolkit has are a modern Clearfix mixin, progressive
enhancement replace text mixins, a triangle generation mixin, and an intrinsic
ratio mixin to make using intrinsic ratios super easy. It also adds
`*, *:before, *:after { box-sizing: border-box}` and
`img, video { max-width: 100%; height: auto; }` to your stylesheets, which are
the first two things I do for any responsive project.

SR: Toolkit's templates have also evolved, Where originally there were five some
odd different templates to choose from, now there are just two, a basic one to
set up a basic partial structure, and a responsive web design one that pulls in
Breakpoint 2.x for media queries and Singularity 1.x for grids.

**IB: You [sure know](http://breakpoint-sass.com/) those late twentieth-century
presidents.**

MW: With a name like Breakpoint, how could I not revisit the cinema classic
Point Break. Bodhi and his gang of thrill-seeking bank-robbing surfers evaded
the FBI for years until the newly minted Special Agent Johnny Utah was on the
case. I think we can all agree that there's a poignant metaphor for web designer
there. And some pretty sweet GIFs.
