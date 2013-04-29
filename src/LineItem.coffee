class LineItem
	constructor: (description) ->
		@description = description

	isFood: ->
		@description == "asador"

module.exports = LineItem