var gulp = require('gulp');
var mainBowerFiles = require('main-bower-files');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var cleancss = require('gulp-clean-css');
var cssGlobbing = require('gulp-css-globbing');
var notify = require("gulp-notify");

gulp.task('styles', function() {
  return console.log('Bower: ' + mainBowerFiles());
  return gulp.src(mainBowerFiles())
  return gulp.src('src/styles/*.scss')
        .pipe(cssGlobbing({
          extensions: ['.scss']
        }))
        .pipe(sass({
          sourcemap: true,
          sourceComments: 'normal',
          onError: function(err) {
            return notify().write(err);
          }
        .pipe(autoprefixer('last 2 version'))
        .pipe(minifycss({advanced:false}))
        .pipe(gulp.dest('staging/css'));
});
