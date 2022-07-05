var gulp = require("gulp");
var del = require("del");
var fileinclude = require("gulp-file-include");
var scss = require("gulp-sass")(require("sass"));
var clean = require("gulp-clean");
var browserSync = require("browser-sync").create();

var paths = {
  dev: {
    src: "./src",
    css: "./src/common/css/*.scss",
    js: "./src/common/**/*.js",
    html: ["./src/common/html/**/*.html", "!./src/pages/**/include/*.html"],
    resource: [
      "./src/common/**/*",
      "!./src/common/**/*.js",
      "!./src/common/**/*.scss",
      "!./src/common/**/*.html",
    ],
  },
  dist: {
    src: "./dist",
    css: "./dist/common/css",
    js: "./dist/common",
    html: "./dist/common/html",
    resource: "./dist/common",
  },
};

var scssOptions = {
  outputStyle: "expanded",
  indentType: "tab",
  indentWidth: 2,
  precision: 6,
  sourceComments: false,
};
function setHtml() {
  return gulp
    .src(paths.dev.html)
    .pipe(
      fileinclude({
        prefix: "@@",
        basepath: "@file",
      })
    )
    .pipe(gulp.dest(paths.dist.html))
    .pipe(browserSync.reload({ stream: true }));
}

function setJs() {
  return gulp
    .src(paths.dev.js)
    .pipe(gulp.dest(paths.dist.js))
    .pipe(browserSync.reload({ stream: true }));
}
function setCss() {
  return gulp
    .src(paths.dev.css)
    .pipe(scss(scssOptions).on("error", scss.logError))
    .pipe(gulp.src("./src/css/*.css"), { passthrough: true })
    .pipe(gulp.dest(paths.dist.css))
    .pipe(browserSync.reload({ stream: true }));
}

function setResource() {
  return gulp
    .src(paths.dev.resource)
    .pipe(gulp.dest(paths.dist.resource))
    .pipe(browserSync.reload({ stream: true }));
}

function watchFiles() {
  gulp.watch(paths.dev.css, setCss);
  gulp.watch(paths.dev.js, setJs);
  gulp.watch(paths.dev.html, setHtml);
  gulp.watch(paths.dev.resource, setResource);
}
function brwSync() {
  return browserSync.init({
    server: {
      baseDir: paths.dist.src,
    },
    port: 8000,
  });
}
function setClean() {
  return gulp.src(paths.dist.src, { read: false }).pipe(clean());
}

gulp.task(
  "default",
  gulp.parallel(
    brwSync,
    gulp.series(setClean, setHtml, setCss, setJs, setResource),
    watchFiles
  )
);
