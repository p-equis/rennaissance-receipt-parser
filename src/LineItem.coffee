class LineItem
	foodIdentifiers = ["asador", "club lng", "rmservic"]

	constructor: (options) ->
		@description = options.description
		@price = options.price

	isFood: -> @description.toLowerCase() in foodIdentifiers

module.exports = LineItem