should = require("should")
App = require "../src/App.js"

describe "The App", ->
	it "should write to the console when you give it a file that isn't a receipt", ->
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

		message.should.equal "That file doesn't look like a real Rennaisance receipt!"