cheerio = require("cheerio")

class LineItemParser
	parse: (html) ->
		$ = cheerio.load(html)
		identifierCell = $('td').filter( -> this.text() == "ROOM TR").first()
		tableContainingLineItems = identifierCell.parent().parent()
		rows = tableContainingLineItems.children()
		
		rows.filter( ->
			this.children().length == 7
		)
		.map( ->
			cells = this.children()
			description: $(cells[2]).text()
		)

module.exports = LineItemParser