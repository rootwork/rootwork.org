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

Set the path to your content images (if using
[Page Bundles](https://gohugo.io/content-management/page-bundles/#leaf-bundles),
it's `content/`) at the top of the script, and enable or disable the following
actions:

- Optimize images with [Imagemagick](https://imagemagick.org/).
- Scale large images down to 1000 pixels wide.
- Create [WebP](https://en.wikipedia.org/wiki/WebP) versions of images with
  [cwebp](https://developers.google.com/speed/webp/docs/cwebp)
- Create [AVIF](https://en.wikipedia.org/wiki/AVIF) versions of images with
  [avif-cli](https://github.com/lovell/avif-cli)

This script is called as part of the production build, below.

## Generate the site for production

`npm run p`

This will generate the Hugo site in `public` with minification turned on. It's
equivalent to running:

```sh
hugo --source ./hugo --minify --gc
```
