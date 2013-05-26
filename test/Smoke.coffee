should = require("should")
util = require("util")
exec = require("child_process").exec

describe "Smoke tests", ->
	returnValue = null

	beforeEach (done) ->
		child = exec("sh expenseCalculator test/receipt.html", (error, stdout, stderr) ->
		  returnValue = error if error isnt null
		  done()
		)

	it "should not throw an error", -> 
		should.not.exist returnValue