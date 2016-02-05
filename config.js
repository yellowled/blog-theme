// Grunt configuration
module.exports = {
    autoprefixer: {
        browsers:   ['> 1%', 'last 2 versions']
    },
    concat: {
        src: [
                    'node_modules/svg4everybody/dist/svg4everybody.js',
                    'node_modules/jquery-collapse/src/jquery.collapse.js',
                    'node_modules/prismjs/prism.js',
                    'node_modules/prismjs/plugins/show-language/prism-show-language.js',
                    'node_modules/prismjs/components/prism-bash.js',
                    'node_modules/prismjs/components/prism-php.js',
                    'node_modules/prismjs/components/prism-scss.js',
                    'node_modules/prismjs/components/prism-smarty.js',
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
