// Grunt configuration
module.exports = {
    autoprefixer: {
        browsers:   ['> 1%', 'last 2 versions']
    },
    concat: {
        src: [
                    'node_modules/svg4everybody/dist/svg4everybody.js',
                    'node_modules/responsive-nav/responsive-nav.js',
                    'src/scripts/main.js'
              ],
        dest:       'src/scripts/master.js'
    },
    copy: {
        src: [
                    '*.php',
                    '*.tpl',
                    'info.txt',
                    'UTF-8/*.php'
              ],
        dest:       'dist'
    },
    modernizr: {
        dev:        'src/scripts/modernizr/modernizr.js',
        dest:       'dist/scripts/modernizr/modernizr.js',
        srcfiles: [
                    'src/scss/**/*.scss',
                    'src/scripts/master.js'
        ]
    }
};
