should = require("should")
App = require "../src/App.js"

describe "The App", ->
	
	describe "failure conditions", ->
		it "should write a helpful message to the console when you give it a file that isn't a receipt", ->
			NotARealReceipt = class NotARealReceipt
			message = {}
			
			app = new App(
				Hotel: -> throw new NotARealReceipt
				NotARealReceipt: NotARealReceipt
				process:
					argv: ["", "", "path to a fake receipt"]
				console:
					log: (text) -> message = text
			)

			app.generateReport()

			message.should.equal "That file doesn't look like a real Rennaisance receipt!"

		it "should write a usage message if you don't give it a file to read from", ->
			message = ""
			exitCode = 0
			
			app = new App(
				process:
					argv: []
					exit: (code) -> exitCode = code
				console:
					log: (text) -> message = text
			)

			message.should.equal "\tUsage: expenses <pathToReceipt>\n"
			exitCode.should.equal 1


	describe "happy path", ->
		it "should write the results of exactly how much you should expense", ->
			message = ""

			app = new App(
				Hotel: 
					class Hotel
						actualExpenses: -> 60.5
				process: 
					argv: ["", "", "pathToReceipt"]
				console:
					log: (text) -> message = text
			)

			app.generateReport()

			message.should.equal "You should actually expense: $60.5"

