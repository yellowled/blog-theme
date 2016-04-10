// Postprocess generated CSS
var config = require('../config');

module.exports = function(grunt) {
    grunt.config('postcss', {
        options: {
            diff: false,
            map: false,
            processors: [
                require('pixrem')({
                    unitPrecision: 0
                }),
                require('autoprefixer')({
                    browsers: config.autoprefixer.browsers,
                    cascade: false,
                    remove: true
                }),
                require('css-mqpacker')({
                    sort: true
                }),
                require('cssnano')()
            ]
        },
        all: {
            expand: true,
            flatten: true,
            src: 'src/*.css',
            dest: 'dist/<%= pkg.name %>/'
        }
    });
};
