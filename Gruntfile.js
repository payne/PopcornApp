module.exports = function(grunt) {
    grunt.initConfig({
        ajaxSeo: {
            all: {
                options: {
                    // The list of the URLs to start with
                    urls: [
                        'http://localhost:3000'
                    ],
                    // Directory (relative to this file) where the snapshots should be saved
                    snapshotPath: 'public/snapshots',
                    webSecurity: false,
                    waitTime: 2000
                }
            }
        }
    });
    grunt.loadNpmTasks('grunt-ajax-seo');
};