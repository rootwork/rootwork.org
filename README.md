Rootwork.org
============
Rootwork is created with the static site generator [Hugo](http://gohugo.io) and
[Gulp](http://gulpjs.com) as the task runner. Hugo is installed locally via
Homebrew. Rootwork's backend is a fork of
[Hugulp](https://github.com/jbrodriguez/hugulp) from the Jun 8, 2016 commit.
Hugulp's README follows.

hugulp
======

hugulp is a starter project for [Hugo](http://gohugo.io) + [Gulp](http://gulpjs.com).

It combines Hugo's fast static site generation with Gulp's flexibility to coordinate related tasks.

The main idea is to recreate the famous [Ruby on Rails Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html), which minifies, concatenates and fingerprints the assets used in your website.

This leads to less and smaller network requests to your page, improving overall user experience.

Read [this blog post](http://jbrodriguez.io/mobile-friendly-website-2/) and [this article](https://medium.com/@juanbrodriguez/hugulp-a-hugo-gulp-toolchain-94f72ccc3577) for additional context.

This project includes the following tools, tasks and workflows:

- [BrowserSync](http://www.browsersync.io/)
- [SASS](http://sass-lang.com/) (super fast libsass)
- [autoprefixer](https://github.com/sindresorhus/gulp-autoprefixer)
- [ClearCss](https://github.com/scniro/gulp-clean-css)
- [Javascript Lint](https://github.com/spalger/gulp-jshint)
- [Uglify](https://github.com/terinjokes/gulp-uglify)
- [Image optimization](https://github.com/sindresorhus/gulp-imagemin) (only [changed images](https://github.com/sindresorhus/gulp-changed))
- Asset Fingerprinting using [gulp-rev](https://github.com/sindresorhus/gulp-rev) and [gulp-rev-replace](https://github.com/jamesknelson/gulp-rev-replace)


## Install Hugo
[Follow the instructions](http://gohugo.io/#action).

If Hugo is already installed, copy the folders in its current location to the hugo folder of this project.

Also, copy the following folders:
- hugo/static/img to src/img
- hugo/static/css to src/styles
- hugo/static/js to src/scripts
- any svg files to src/svg

## Install Node
[Follow the instructions](https://nodejs.org)

If Node is already installed, no further action is required.

## Install npm dependencies
```
$ npm install
```

This runs through all dependencies listed in `package.json` and downloads them to a `node_modules` folder in your project directory.

This will also install a copy of gulp locally (rather than globally), which is [generally preferable](http://jondavidjohn.com/keeping-it-local-with-npm-scripts/)

## Run gulp
Run the `default` gulp task with

```
$ gulp
```

It will do the following:
- The **styles**, **scripts** and **images** tasks get executed first to do the heavy lifting of compressing images and minifying css/js files.
- The **revision** task runs next to fingerprint the optimized assets.
- Then the **hugo:all** task is invoked to generate the static site

hugo will run as if invoked like this:
```
$ hugo --config=./hugo/config.yaml -s ./hugo -d ./public --buildDrafts=true --verbose=true --baseUrl="http://localhost:3000/"
```

- The **reference:all** task replaces all asset ocurrences with their fingerprinted versions
- Finally, the browser is reloaded so that you can very quickly check the changes you made

## Publish step
There's also a `publish` task you can run:

```
$ gulp publish
```

It will perform all the steps above, but Hugo will be run with as follows:
```
$ hugo --config=./hugo/config.yaml -s ./hugo -d ./public"
```

## PR
For changes, send a PR.


## Share
Made by [Juan B. Rodriguez](http://jbrodriguez.io), with a MIT License.

Please [share the article or leave your comments](http://jbrodriguez.io/mobile-friendly-website-2/).
