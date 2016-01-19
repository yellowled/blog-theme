// Minify CSS
module.exports = function(grunt) {
    grunt.config('cssmin', {
        options: {
            report: 'min',
            sourceMap: false
        },
        deploy: {
            files:[{
                expand: true,
                cwd: 'src',
                src: ['*.css'],
                dest: 'dist',
                ext: '.css'
            }]
        }
    });
};
