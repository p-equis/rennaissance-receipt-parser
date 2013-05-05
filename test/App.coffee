should = require("should")
App = require "../src/App.js"

describe "The App", ->
	it "should write to the console when you give it a file that isn't a receipt", ->
		NotARealReceipt = class NotARealReceipt
		Hotel = -> throw new NotARealReceipt
		message = {}
		console = {}
		process = {}
		console.log = (text) -> message = text 
		process.argv = ["", "", "path to a fake receipt"]

		app = new App(Hotel, NotARealReceipt, process, console)

		message.should.equal "That file doesn't look like a real Rennaisance receipt!"