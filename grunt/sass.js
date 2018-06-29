// Compile SCSS files to CSS
const sass = require('node-sass');

module.exports = function(grunt) {
    grunt.config('sass', {
        build: {
            options: {
                implementation: sass,
                outputStyle: 'nested',
                precision: 4,
                sourceMap: false
            },
            files: [{
                expand: true,
                cwd: 'src',
                src: ['*.scss'],
                dest: 'src',
                ext: '.css'
            }]
        }
    });
};
