// Grunt configuration
module.exports = {
    autoprefixer: {
        browsers:   ['> 1%', 'last 2 versions']
    },
    concat: {
        src: [
                    'node_modules/jquery-collapse/src/jquery.collapse.js',
                    'node_modules/svg4everybody/dist/svg4everybody.js',
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
        dest:       'dist/<%= pkg.name %>'
    },
    modernizr: {
        dev:        'src/scripts/modernizr/modernizr.js',
        dest:       'dist/<%= pkg.name %>/scripts/modernizr/modernizr.js',
        srcfiles: [
                    'src/scss/**/*.scss',
                    'src/scripts/master.js'
        ]
    }
};
