# blog-theme

[![Dependency Status](https://david-dm.org/yellowled/blog-theme.svg)](https://david-dm.org/yellowled/blog-theme)
[![devDependency Status](https://david-dm.org/yellowled/blog-theme/dev-status.svg)](https://david-dm.org/yellowled/blog-theme#info=devDependencies)

[Serendipity](http://s9y.org) (s9y) blog theme for [my blog](http://yellowled.de)

## Requirements

* [node.js](http://nodejs.org)
* [Grunt](http://gruntjs.com)
* `npm i` (in the project directory)
* `grunt`

## Deployment

`grunt` creates a directory `dist` which contains a subdirectory named like the theme. You can set this name by editing the value for `name` in `package.json` (defaults to `blog-theme`).

`rsync` or `sftp` that directory to `/templates/` in your s9y installation (i.e. `/templates/blog-theme/`).

## Important

Please note that this theme bundles the [Calendas plus](http://calendasplus.com) webfont. If you clone or fork this repository to use blog-theme yourself, you need to either purchase a license for the webfont or remove it!
