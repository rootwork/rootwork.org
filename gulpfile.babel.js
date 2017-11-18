// Scaffolding
import gulp from "gulp";
import {spawn} from "child_process";
import hugoBin from "hugo-bin";
import gutil from "gulp-util";

// Styles
import postcss from "gulp-postcss";
import cssImport from "postcss-easy-import";
import sass from "gulp-sass";
import sourcemaps from "gulp-sourcemaps";
import autoprefixer from "autoprefixer";

// Images
import imagemin from "gulp-imagemin";
import changed from "gulp-changed";

// Browsering
import BrowserSync from "browser-sync";
import watch from "gulp-watch";
import webpack from "webpack";
import webpackConfig from "./webpack.conf";
const browserSync = BrowserSync.create();

// Hugo arguments
const hugoArgsDefault = ["-d", "../dist", "-s", "site", "-v"];
const hugoArgsPreview = ["--buildDrafts", "--buildFuture"];

// Development tasks
gulp.task("hugo", (cb) => buildSite(cb));
gulp.task("hugo-preview", (cb) => buildSite(cb, hugoArgsPreview));

// Build/production tasks
gulp.task("build", ["css", "js"], (cb) => buildSite(cb, [], "production"));
gulp.task("build-preview", ["css", "js"], (cb) => buildSite(cb, hugoArgsPreview, "production"));

// Compile Sass to CSS
gulp.task("css", () => (
  gulp.src("./src/sass/*.scss")
    .pipe(postcss([
      cssImport({
        from: "./src/sass/main.sass"
      })
    ]))
    .pipe(sourcemaps.init())
    .pipe(sass({
      sourcemap: true,
      sourceComments: "normal",
      onError: function(err) {
        return notify().write(err);
      }
    }))
    .pipe(postcss([ autoprefixer("last 2 versions") ]))
    .pipe(sourcemaps.write("."))
    .pipe(gulp.dest("./dist/css"))
    .pipe(browserSync.stream())
));

// Compile Javascript
gulp.task("js", (cb) => {
  const myConfig = Object.assign({}, webpackConfig);
  webpack(myConfig, (err, stats) => {
    if (err) throw new gutil.PluginError("webpack", err);
    gutil.log("[webpack]", stats.toString({
      colors: true,
      progress: true
    }));
    browserSync.reload();
    cb();
  });
});

// Minify images
gulp.task("images", function () {
  return gulp.src("src/images/*.*")
    .pipe(changed("dist/images"))
    .pipe(imagemin())
    .pipe(gulp.dest("dist/images"));
});

// Development server with browsersync
gulp.task("server", ["hugo", "css", "js", "images"], () => {
  browserSync.init({
    server: {
      baseDir: "./dist"
    }
  });
  watch("./src/js/**/*.js", () => { gulp.start(["js"]) });
  watch("./src/sass/**/*.css", () => { gulp.start(["css"]) });
  watch("./src/sass/**/*.scss", () => { gulp.start(["css"]) });
  watch("./src/images/*.*", () => { gulp.start(["images"]) });
  watch("./site/**/*", () => { gulp.start(["hugo"]) });
});

/**
 * Run hugo and build the site
 */
function buildSite(cb, options, environment = "development") {
  const args = options ? hugoArgsDefault.concat(options) : hugoArgsDefault;

  process.env.NODE_ENV = environment;

  return spawn(hugoBin, args, {stdio: "inherit"}).on("close", (code) => {
    if (code === 0) {
      browserSync.reload();
      cb();
    } else {
      browserSync.notify("Hugo build failed :(");
      cb("Hugo build failed");
    }
  });
}
