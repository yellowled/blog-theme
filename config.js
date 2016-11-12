// Grunt configuration
module.exports = {
    autoprefixer: {
        browsers:   ['> 1%', 'last 2 versions']
    },
    concat: {
        src: [
                    'node_modules/svg4everybody/dist/svg4everybody.js',
                    'node_modules/fontfaceobserver/fontfaceobserver.js',
                    'node_modules/fr-offcanvas/dist/froffcanvas.min.js',
                    'node_modules/prismjs/prism.js',
                    'node_modules/prismjs/plugins/show-language/prism-show-language.js',
                    'node_modules/prismjs/components/prism-php.js',
                    'node_modules/prismjs/components/prism-scss.js',
                    'node_modules/prismjs/components/prism-smarty.js',
                    'src/scripts/main.js'
              ],
        dest:       'src/scripts/master.js'
    },
    copy: {
        src: [
                    'fonts/*',
                    'preview.png',
                    'preview_fullsize.jpg',
                    '*.php',
                    'UTF-8/*.php',
                    '*.tpl',
                    'info.txt'
              ],
        dest:       'dist/<%= pkg.name %>'
    },
    modernizr: {
        dev:        'src/scripts/modernizr/modernizr.js',
        dest:       'dist/<%= pkg.name %>/scripts/modernizr/modernizr.js',
        srcfiles: [
                    'node_modules/node-normalize-scss/_normalize.scss',
                    'src/scss/**/*.scss',
                    'src/scripts/master.js'
        ]
    }
};