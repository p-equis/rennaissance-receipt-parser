LineItemParser = require("./LineItemParser")
LineItem = require("./LineItem")
Receipt = require("./Receipt")
fileSystem = require("fs")

class Hotel
	constructor: (options) ->
		html = fileSystem.readFileSync(options.pathToReceipt, "utf8")
		parser = new LineItemParser(html)
		@receipt = new Receipt(parser.parse())

	actualExpenses: -> @receipt.getTotalWithoutFood()

	totalBilled: -> @receipt.getTotal()

module.exports = Hotel