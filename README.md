# blog-theme

This is the blog theme for [my blog](http://yellowled.de), but you can use it for your [Serendipity](http://s9y.org) (s9y) blog, too.

## Requirements

You'll need [node.js](http://nodejs.org) and [Grunt](http://gruntjs.com). Clone this respository, do `npm i` in the project directory and run `grunt` to create a build.

## Deploying the theme

`grunt` creates a directory `dist` which contains all the theme's files. `rsync` or `sftp` the contents of `dist` to `/templates/YOURTHEME/` in your s9y installation.
