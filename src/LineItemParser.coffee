cheerio = require("cheerio")
LineItem = require("./LineItem")
_string = require("underscore.string")
NotARealReceipt = require("./NotARealReceipt.js")

class LineItemParser
	$ = {}

	constructor: (html) ->
		if(! _string.include(html, "eFolio"))
			throw new NotARealReceipt()
		$ = cheerio.load(html)

	_getRawLineItems: ->
		identifierCell = $('td').filter( -> this.text() == "ROOM TR").first()
		tableContainingLineItems = identifierCell.parent().parent()
		numberOfCellsInALineItem = 7
		tableContainingLineItems
			.children()
			.filter( -> this.children().length == numberOfCellsInALineItem)
			.slice 1


	parse: ->
		rows = this._getRawLineItems()
		
		rows.map ->
			cells = this.children()
			new LineItem(
				description: $(cells[2]).text()
				price: +$(cells[4]).text()
			)

module.exports = LineItemParser