should = require("should")
exec = require("child_process").exec
fs = require("fs-extra")

shouldNotHaveAnError = (path, done, cleanup) ->
	exec("sh expenseCalculator #{path}", (error) ->
	  should.not.exist error
	  cleanup() unless not cleanup
	  done()
	)

describe "Smoke tests", ->
	it "should not throw an error", (done)-> 
		shouldNotHaveAnError "test/receipt.html", done
		
	it "should not throw an error even when the path has multiple words", (done) ->
		fs.copy("test/receipt.html", "test/receipt with spaces.html", (err)->
				shouldNotHaveAnError "test/receipt with spaces.html", done, -> fs.remove("test/receipt with spaces.html") 
		)
