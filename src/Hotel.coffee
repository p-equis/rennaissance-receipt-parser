LineItemParser = require("./LineItemParser")
LineItem = require("./LineItem")
Receipt = require("./Receipt")
fileSystem = require("fs")

class Hotel
	constructor: (options) ->
		html = fileSystem.readFileSync(options.pathToReceipt, "utf8")
		@parser = new LineItemParser(html)

	actualExpenses: -> 
		lineItems = @parser.parse()
		new Receipt(lineItems).getTotalWithoutFood()

	totalBilled: ->
		lineItems = @parser.parse()
		new Receipt(lineItems).getTotal()

module.exports = Hotel