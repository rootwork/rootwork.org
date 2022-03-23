# Rootwork.org publishing system

Currently [Rootwork.org](https://rootwork.org) has a
[temporary landing page](https://github.com/rootwork/rootwork_landing); this
publishing system will replace it once it's ready.

---

Rootwork is created with the static site generator [Hugo](http://gohugo.io)
using the [Hugo Clarity](https://github.com/chipzoller/hugo-clarity) theme with
customizations.

Also included in this repo are some Bash scripts to
[create a post](#creating-a-new-post), [start the server](#local-development)
and
[generate a production copy of the site](#generating-the-site-for-production).
They are user-configurable and meant to be easy to fork. [Take a look!](scripts)

---

<!-- The following section, from "ts" to "te", is an automatically-generated
  table of contents, updated whenever this file changes. Do not edit within
  this section. -->

<!--ts-->

- [Rootwork.org publishing system](#rootworkorg-publishing-system)
- [Local development](#local-development)
  - [Creating a new post](#creating-a-new-post)
  - [Editing site variables](#editing-site-variables)
  - [Hugo modules](#hugo-modules)
  - [Editing the theme](#editing-the-theme)
- [Generating the site for production](#generating-the-site-for-production)
- [Fresh installation](#fresh-installation)
  - [Go](#go)
  - [Hugo](#hugo)
  - [This repo](#this-repo)
  - [Node/npm](#nodenpm)
- [Updating dependencies](#updating-dependencies)
  - [Go](#go-1)
  - [Hugo](#hugo-1)
  - [Hugo modules](#hugo-modules-1)
- [Licenses](#licenses)

<!-- Added by: runner, at: Wed Mar 23 20:54:00 UTC 2022 -->

<!--te-->

---

# Local development

`npm run s` or `./scripts/server_start.sh`

Set your preferred configuration at the top of the script for base URL
(`http://localhost` by default), port (`1313` by default) and open command
(`xdg-open`, a Linux command, by default).

When you run this script, your default web browser will automatically open the
site.

By default Hugo will run with fastRender **on** and buildDrafts **off**. You can
use the flags `-s` and `-d` to change this. For details, run `npm run s -- -h`.

## Creating a new post

`npm run n` or `./scripts/new_blog_post.sh`

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

## Editing site variables

You can find text strings and other variables in several places:

- `hugo/config/_default/config.toml` (main configuration)
- `hugo/i18n/en.toml` (translatable strings, such as the copyright)
- `hugo/config/_default/menus/menu.en.toml` (menus)
- `hugo/config/_default/configTaxo.toml` (embedded social media settings)
- `hugo/config/_default/markup.toml` (settings for Hugo's markup highlighter)
- `hugo/config/_default/params.toml` (other site parameters used in the theme)

## Hugo modules

The site imports components like the theme as
[Hugo modules](https://gohugo.io/hugo-modules/) rather than as git submodules
(as in the past).
[More information about this approach.](https://github.com/rootwork/hugo-module-site)

The `go.mod` file is in the `hugo` directory of the repository, and modules are
loaded in `hugo/config/_default/config.toml`.

## Editing the theme

Customizing a theme is done by
[overriding theme files](https://gohugo.io/hugo-modules/theme-components/).
Because themes are loaded dynamically using Hugo modules, go to the themes'
original repos to see what files to override and their initial content.

Add notes at the top of any overridden files using Go comments (`{{/* */}}`) to
note what has been changed -- this vastly eases integrating new changes to the
overridden files from upstream.

For styles, we use `assets/sass/_override.sccs` to load our own component
styles, which override parent theme styles as necessary. We could use
`_custom.scss` for components that have nothing to override, but in practice
this just makes things more confusing; it's easier to simply import everything
as an override.

# Generating the site for production

`npm run p` or `./scripts/production_build.sh`

Set the path to your Hugo and `public` directories at the top of the script, and
enable or disable running the [image script](scripts/image_optimize.sh) as part
of this build. (See
[information about the image script](scripts#generate-optimized-and-modern-images)
for details.)

The `public` directory, if it exists, will be removed to ensure that no outdated
files are present.

The site will then be re-generated in `public`, with minification turned on. You
can
[fine tune this in your site configuration](https://gohugo.io/getting-started/configuration/#configure-minify)
or disable it completely with the `-m` flag.

Note that `public` is excluded from the repo in `.gitignore`, so this command
should be run from a GitHub Action or other CI to build the site.

# Fresh installation

## Go

- [Follow the instructions](https://golang.org/doc/install)

## Hugo

- Get the `hugo_extended_VERSION_OS-64bit.*`
  [package from GitHub releases](https://github.com/gohugoio/hugo/releases)
  (e.g. `hugo_extended_0.81.0_Linux-64bit.deb`). On Debian-based Linux systems,
  ignore the alert that
  [an older package is available in the channel](https://gohugo.io/getting-started/installing#debian-and-ubuntu).
- Install the package, which will place it in `/usr/local/bin/hugo`.

## This repo

- `git clone git@github.com:rootwork/rootwork.org.git`
- `cd rootwork.org`

## Node/npm

`npm i`

Node is used for automated tools like Prettier. Tested with Node 14.x and 16.x,
and npm 6.x and 8.x.

# Updating dependencies

## Go

- Check version: `go version`
- [Remove old version and install new version](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753)

## Hugo

- Check version: `hugo version`
- `sudo rm -rf /usr/local/bin/hugo`
- Reinstall following the instructions above.

## Hugo modules

- Update all modules: `hugo mod get -u`
- Update all modules recursively: `hugo mod get -u ./...`
- Update a single module: `hugo mod get -u <repo_path>`
- Update a single module to a specific version (tag
  [must use semver](https://go.dev/doc/modules/version-numbers)):
  `hugo mod get <repo_path>@<git_tag>`

## Node modules

`npm outdated`

Then `npm up <module>` as necessary, and commit.

# Licenses

The content of the site, contained in the Markdown files in the `hugo/content`
directory and its subdirectories **only**, is [licensed](hugo/content/LICENSE)
under the
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).
Images or other media in these directories may have different copyright and
licensing statuses.

Hugo itself is licensed as
[Apache v2.0](https://github.com/gohugoio/hugo/blob/master/LICENSE).

The theme Rootwork.org uses, Hugo Clarity, is licensed under the
[MIT license](https://github.com/chipzoller/hugo-clarity/blob/master/LICENSE.md).

Modifications to the theme, as well as the files in the `scripts` directory, are
licensed under the
[GNU Affero General Public License v3.0](https://www.gnu.org/licenses/agpl-3.0.txt),
as noted in the general project
[LICENSE](https://github.com/rootwork/rootwork.org/blob/master/LICENSE) file.
