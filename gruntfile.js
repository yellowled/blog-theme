module.exports = function(grunt) {
    // Load tasks when needed
    require('jit-grunt')(grunt);

    // Initialize config
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
    });

    // Load required tasks from submodules
    grunt.loadTasks('grunt');

    // Default task
    grunt.registerTask('default', ['build']);

    // Deployment
    grunt.registerTask('build', [
        'clean',
        'copy',
        'concat',
        'sass',
        'postcss',
        'cssmin',
        'uglify',
        'svgstore',
        'svgmin',
        'modernizr'
    ]);
};
