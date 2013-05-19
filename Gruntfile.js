module.exports = function(grunt){
  grunt.initConfig({
    simplemocha : {
			all : { 
		  	src : ["out/test/*.js"],
		  }
		}
  });

	grunt.loadNpmTasks("grunt-simple-mocha");

	grunt.registerTask("test", ["simplemocha"]);
	
	grunt.registerTask("default", ["test"]);
};
