# Rootwork.org

Rootwork is created with the static site generator [Hugo](http://gohugo.io) using the [Hugo Clarity](https://github.com/chipzoller/hugo-clarity) theme with customizations. This repository contains the backend code used to generate the site files.

## Usage

### Installation

Hugo:

* On systems (e.g. Ubuntu) with Snap already installed, run `snap install hugo --channel=extended`
* Otherwise, get the `hugo_extended_VERSION_OS-64bit.*` [package from GitHub releases](https://github.com/gohugoio/hugo/releases) (on Debian-based Linux systems, ignore the alert that [an older package is available in the channel](https://gohugo.io/getting-started/installing#debian-and-ubuntu))

This repo:

* `git clone git@github.com:rootwork/rootwork.org.git`
* `cd rootwork.org`
* `git submodule update --init --recursive`

### Developing

@TODO

### Generating the site for production

`hugo -D`

The static site is rendered in the `public` directory.

### Editing the theme

@TODO

## License

The content of the site, located in the `content` directory, is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/), and the source code used to format and display that content is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.txt).
