# Helpful Hugo Bash scripts

Used for generating [Rootwork.org](https://rootwork.org), feel free to copy or
fork!
[AGPLv3 license.](https://github.com/rootwork/rootwork.org/blob/main/LICENSE)

I run these
[via npm](https://github.com/rootwork/rootwork.org#local-development), but you
can just as easily run them directly in Bash/zsh/etc.

## Launch Hugo server and open browser

[`server_start.sh`](server_start.sh)

Set your preferred configuration at the top of the script for base URL
(`http://localhost` by default), port (`1313` by default) and open command
(`xdg-open`, a Linux command, by default).

When you run this script, your default web browser will automatically open the
site.

By default Hugo will run with fastRender **on** and buildDrafts **off**. You can
use the flags `-s` and `-d` to change this. Run `./server_start.sh -h` for
details.

## Create new posts with monthly and yearly archives

[`new_blog_post.sh`](new_blog_post.sh)

Set your preferred text editor at the top of the script.

This script will:

- Ask you for a title
- Ask you for a date (defaults to today)
- Create an appropriate slug
- Create
  [taxonomy year and month files](https://www.jayeless.net/2021/04/taxonomies-archive-hugo.html),
  if necessary (cf. https://github.com/gohugoio/hugo/issues/448 )
- Create the necessary Markdown file, with sane defaults, at the appropriate
  directory/file location
- Open the file in your text editor

It does much more than just `hugo new ...`.

## Generate optimized and modern images

[`image_optimize.sh`](image_optimize.sh)

Images will be optimized, and modern `.webp` and `.avif` images will be created.

Requires [Imagemagick](https://imagemagick.org/) (which you likely have
already), [cwebp](https://developers.google.com/speed/webp/docs/cwebp) and
[avif-cli](https://github.com/lovell/avif-cli).

I use Hugo
[Page Bundles](https://gohugo.io/content-management/page-bundles/#leaf-bundles),
so this script only looks for images within the `content/` directory.

This script is called as part of the production build script (below).

## Generate the site for production

[`production_build.sh`](production_build.sh)

Performs the following actions:

- The image script is run.
- The `public` directory, if it exists, will be removed to ensure that no
  outdated files are present.
- The static site will be re-generated in `public`, with minification turned on.
  You can
  [fine tune this in your site configuration](https://gohugo.io/getting-started/configuration/#configure-minify)
  or disable it completely with the `-m` flag.
