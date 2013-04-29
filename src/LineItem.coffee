class LineItem
	constructor: (options) ->
		@description = options.description
		@price = options.price

	isFood: ->
		@description == "asador" or 
		@description == "club lng" or 
		@description == "rmservic"


module.exports = LineItem