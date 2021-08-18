Rootwork is created with the static site generator [Hugo](http://gohugo.io)
using the [Hugo Clarity](https://github.com/chipzoller/hugo-clarity) theme with
customizations.

This repository contains the backend code used to generate the site files, and
notes to myself because I forget things.

<!-- The following section, from "ts" to "te", is an automatically-generated
  table of contents, updated whenever this file changes. Do not edit within
  this section. -->

<!--ts-->
* [Local development](#local-development)
   * [Editing site variables](#editing-site-variables)
   * [Editing the theme](#editing-the-theme)
      * [Updating the theme](#updating-the-theme)
* [Creating a new post](#creating-a-new-post)
* [Generating the site for production](#generating-the-site-for-production)
* [Fresh installation](#fresh-installation)
   * [Go](#go)
   * [Hugo](#hugo)
   * [This repo](#this-repo)
* [Updating dependencies](#updating-dependencies)
   * [Go](#go-1)
   * [Hugo](#hugo-1)
* [License](#license)

<!-- Added by: runner, at: Tue Aug 17 23:36:06 UTC 2021 -->

<!--te-->

# Local development

- `npm run s`
- The web browser will automatically open to [http://localhost:1313/](http://localhost:1313/); hit refresh to load the site.

## Creating a new post

`npm run n`

This script will:

- Ask you for a title
- Ask you for a date (defaults to today)
- Create an appropriate slug
- Create [taxonomy year and month files](https://www.jayeless.net/2021/04/taxonomies-archive-hugo.html), if necessary (cf. https://github.com/gohugoio/hugo/issues/448 )
- Create the necessary Markdown file, with sane defaults, at the appropriate directory/file location
- Open the file in Sublime

It does much more than just `hugo new ...`.

## Editing site variables

You can find text strings and other variables in several places:

- `hugo/config/_default/config.toml` (main configuration)
- `hugo/i18n/en.toml` (translatable strings, such as the copyright)
- `hugo/config/_default/menus/menu.en.toml` (menus)
- `hugo/config/_default/configTaxo.toml` (embedded social media settings)
- `hugo/config/_default/markup.toml` (settings for Hugo's markup highlighter)
- `hugo/config/_default/params.toml` (other site parameters used in the theme)

## Editing the theme

Customizing a theme is done by [overriding theme
files](https://gohugobrasil.netlify.app/themes/customizing/). Don't edit the
files in `themes` directly, as they're stored with git submodules.

Add notes at the top of any overridden files using Go comments (`{{/* */}}`) to
note what has been changed -- this vastly eases integrating new changes to the
overridden files from upstream.

Custom styles can be added using the `_custom.scss` file within `assets`. Use
`_override.scss` to change the theme's variables located in `_variables.sass`.

### Updating the theme

Use `git submodule foreach git pull origin master` to pull in upstream changes.
If that errors, you can also try `git submodule update --init --recursive`. Note
that there's no real guarantee this won't break things in the theme!

# Generating the site for production

`npm run p`

This removes the `public` directory, if it exists, to ensure that no outdated files are present. Then it recreates the static site in the `public` directory.

Note that the `public` directory is excluded from the repo in `.gitignore`, so this command should be run from a GitHub Action to generate the site online.

# Fresh installation

## Go

- [Follow the instructions](https://golang.org/doc/install)

## Hugo

- Get the `hugo_extended_VERSION_OS-64bit.*` [package from GitHub
releases](https://github.com/gohugoio/hugo/releases) (e.g.
`hugo_extended_0.81.0_Linux-64bit.deb`). On Debian-based Linux systems, ignore
the alert that [an older package is available in the
channel](https://gohugo.io/getting-started/installing#debian-and-ubuntu).
- Install the package, which will place it in `/usr/local/bin/hugo`.

## This repo

- `git clone git@github.com:rootwork/rootwork.org.git`
- `cd rootwork.org`
- `git submodule update --init --recursive`

# Updating dependencies

## Go

- Check version: `go version`
- [Remove old version and install new
version](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753)

## Hugo

- Check version: `hugo version`
- `sudo rm -rf /usr/local/bin/hugo`
- Reinstall following the instructions above.

# License

The content of the site, located in the `hugo/content` directory **only**, is
licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0
International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

The source code used to format and display that content is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.txt), as
noted in the
[LICENSE](https://github.com/rootwork/rootwork.org/blob/master/LICENSE) file.
