module.exports = function(grunt){
	grunt.initConfig({
		simplemocha : {
			all : { 
				src : ["out/test/*.js"],
			}
		},
		coffee : {
			glob_to_multiple : {
				expand: true,
				flatten: false,
				cwd: '.',
				src: ['src/*.coffee', 'test/*.coffee'],
				dest: 'out/',
				ext: '.js'
			}
		},
		clean : {
			build: ["out/"]
		}
	});

	grunt.loadNpmTasks("grunt-contrib-clean");
	grunt.loadNpmTasks("grunt-contrib-coffee");
	grunt.loadNpmTasks("grunt-simple-mocha");

	grunt.registerTask("build", ["coffee"]);
	grunt.registerTask("test", ["simplemocha"]);
	
	grunt.registerTask("default", ["build", "test"]);
};
