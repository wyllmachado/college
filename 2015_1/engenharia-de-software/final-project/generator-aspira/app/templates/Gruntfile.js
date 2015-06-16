module.exports = function (grunt) {
    'use strict';

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        clean: ['public/', 'src/css/'],

        jshint: {
            allFiles: [
                'Gruntfile.js',
                'src/**/*.js'
            ],
            options: {
                jshintrc: '.jshintrc'
            }
        },

        stylus: {
            compile: {
                files: {
                    'src/css/style.css': 'src/styl/index.styl'
                }
            }
        },

        less: {
            'src/css/style.css': 'src/less/index.less'
        },
        lesslint: {
            src: ['src/**/*.less']
        },

        watch: {
            styl: {
                files: ['src/**/*.js', 'src/**/*.styl'],
                tasks: ['clean', 'test-jshint', 'compile-styl', 'copy'],
                options: {
                    spawn: false,
                    livereload: {
                        port: 8080
                    }
                },
            },
            less: {
                files: ['src/**/*.js', 'src/**/*.less'],
                tasks: ['clean', 'test-jshint', 'test-lesslint', 'compile-less', 'copy'],
                options: {
                    spawn: false,
                    livereload: {
                        port: 8080,
                    }
                },
            }
        },

        copy: {
            main: {
                files: [
                    {expand: true, src: ['src/css/*.css'], dest:'public/', filter: 'isFile'},
                    {expand: true, src: ['src/js/*.js'], dest: 'public/', filter: 'isFile'},
                    {expand: true, src: ['*.html'], dest: 'public/', filter: 'isFile'}
                ]
            }
        },

        'http-server': {
            dev: {
                root: 'public/',
                port: 8080,
                host: '0.0.0.0',
                cache: 1000,
                showDir : true,
                autoIndex: true,
                ext: 'html',
                runInBackground: false
            }
        }
    });


    /**
    *
    * LOAD TAKS
    *
    **/
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-lesslint');
    grunt.loadNpmTasks('grunt-http-server');
    grunt.loadNpmTasks('grunt-contrib-clean');

    /**
    *
    * REGISTER TASKS
    *
    **/
    grunt.registerTask('test-jshint', ['jshint']);
    grunt.registerTask('test-lesslint', ['lesslint']);

    grunt.registerTask('watch-less', ['watch:less']);
    grunt.registerTask('watch-styl', ['watch:styl']);

    grunt.registerTask('compile-styl', ['stylus']);
    grunt.registerTask('compile-less', ['less']);

    grunt.registerTask('server', ['http-server']);

    grunt.registerTask('build-styl', ['clean', 'test-jshint', 'compile-styl', 'copy', 'http-server']);
    grunt.registerTask('build-less', ['clean', 'test-jshint', 'test-lesslint', 'compile-less', 'copy', 'http-server']);
};