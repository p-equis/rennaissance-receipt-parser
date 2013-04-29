class LineItem
	foodIdentifiers = ["asador", "club lng", "rmservic"]

	constructor: (options) ->
		@description = options.description.toLowerCase().trim()
		@price = options.price

	isFood: -> @description in foodIdentifiers

module.exports = LineItem