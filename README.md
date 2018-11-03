# blog-theme

[![Dependency Status](https://david-dm.org/yellowled/blog-theme.svg)](https://david-dm.org/yellowled/blog-theme)
[![devDependency Status](https://david-dm.org/yellowled/blog-theme/dev-status.svg)](https://david-dm.org/yellowled/blog-theme#info=devDependencies)

[Serendipity](https://s9y.org) (s9y) blog theme for [my blog](https://yellowled.de)

## Requirements

* [node.js](http://nodejs.org)
* `npm i`
* `npm run build`

## Deployment

`npm run build` creates a directory `dist` which contains a subdirectory named like the theme. You can set this name by editing the value for `name` in `package.json` (defaults to `blog-theme`).

`rsync` or `sftp` that directory to `/templates/` in your s9y installation (i.e. `/templates/blog-theme/`).

## Important

Please note that this theme bundles the [Calendas plus](http://atipofoundry.com/fonts/calendas-plus) webfont. If you clone or fork this repository to use blog-theme yourself, you need to either purchase a license for the webfont or remove it!
