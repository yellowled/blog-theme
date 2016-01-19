# blog-theme

This is the blog theme for [my blog](http://yellowled.de), but you can use it for your [Serendipity](http://s9y.org) (s9y) blog, too.

## Requirements

You'll need [node.js](http://nodejs.org) and [Grunt](http://gruntjs.com). Clone this respository, do `npm i` in the project directory and run `grunt` to create a build.

## Deploying the theme

`grunt` creates a directory `dist` which contains a subdirectory named like the theme. You can set this name by editing the value for `name` in `package.json` (defaults to `blog-theme`).

`rsync` or `sftp` that directory to `/templates/` in your s9y installation (i.e. `/templates/blog-theme/`).
