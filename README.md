# Rootwork.org

Rootwork is created with the static site generator [Hugo](http://gohugo.io)
using the [Hugo Clarity](https://github.com/chipzoller/hugo-clarity) theme with
customizations.

This repository contains the backend code used to generate the site files, and
notes to myself because I forget things.

## Usage

### Installation

#### Go

* [Follow the instructions](https://golang.org/doc/install)

#### Hugo

* Get the `hugo_extended_VERSION_OS-64bit.*` [package from GitHub
releases](https://github.com/gohugoio/hugo/releases) (e.g.
`hugo_extended_0.81.0_Linux-64bit.deb`). On Debian-based Linux systems, ignore the alert
that [an older package is available in the
channel](https://gohugo.io/getting-started/installing#debian-and-ubuntu).
* Install the package, which will place it in `/usr/local/bin/hugo`.

#### This repo

* `git clone git@github.com:rootwork/rootwork.org.git`
* `cd rootwork.org`
* `git submodule update --init --recursive`

### Updating

#### Go

* Check version: `go version`
* [Remove old version and install new
version](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753)

#### Hugo

* Check version: `hugo version`
* `sudo rm -rf /usr/local/bin/hugo`
* Reinstall following the instructions above.

#### This repo

* `cd rootwork.org`
* `git pull -r origin && git submodule update --init --recursive`

### Developing

@TODO

### Generating the site for production

`hugo -D`

The static site is rendered in the `public` directory.

### Editing the theme

@TODO

## License

The content of the site, located in the `content` directory **only**, is
licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0
International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

The source code used to format and display that content is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.txt), as
noted in the
[LICENSE](https://github.com/rootwork/rootwork.org/blob/master/LICENSE) file.
