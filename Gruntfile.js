module.exports = function(grunt){
	grunt.initConfig({
		simplemocha : {
			all : { 
				src : ["out/test/*.js"],
			},
			options : {
				reporter : 'progress'
			}
		},
		coffee : {
			glob_to_multiple : {
				expand: true,
				flatten: false,
				cwd: ".",
				src: ["src/*.coffee", "test/*.coffee"],
				dest: "out/",
				ext: ".js"
			}
		},
		clean : {
			build: ["out/"]
		},
		coffeelint : {
			app : ["src/*.coffee", "test/*.coffee"],
			options : {
				no_tabs: {level: "ignore"},
				indentation : {level: "ignore"},
				max_line_length : {level: "ignore"}
			}
		}
	});

	grunt.loadNpmTasks("grunt-contrib-clean");
	grunt.loadNpmTasks("grunt-contrib-coffee");
	grunt.loadNpmTasks("grunt-simple-mocha");
	grunt.loadNpmTasks("grunt-coffeelint");

	grunt.registerTask("build", ["coffee"]);
	grunt.registerTask("test", ["simplemocha"]);
	
	grunt.registerTask("default", ["coffeelint", "build", "test"]);
};
