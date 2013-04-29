class LineItem
	constructor: (description) ->
		@description = description

	isFood: ->
		@description == "asador" or @description == "club lng" or @description == "rmservic"

module.exports = LineItem