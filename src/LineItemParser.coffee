cheerio = require("cheerio")

class LineItemParser
	$ = {}

	constructor: (html) -> 
		$ = cheerio.load(html)

	_getRawLineItems: ->
		identifierCell = $('td').filter( -> this.text() == "ROOM TR").first()
		tableContainingLineItems = identifierCell.parent().parent()
		tableContainingLineItems
			.children()
			.filter ->
				this.children().length == 7


	parse: ->
		rows = this._getRawLineItems()
		
		rows.map( ->
			cells = this.children()
			description: $(cells[2]).text()
			price: +$(cells[4]).text()
		)

module.exports = LineItemParser