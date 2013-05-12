require "sugar"

class Receipt
	constructor: (lineItems) ->
		@lineItems = lineItems

	getTotalWithoutFood: ->
		lineItems = @lineItems.exclude (lineItem) -> lineItem.isFood()
		total = sum(lineItems)
		roundToTwoDecimalPlaces(total)
		
	roundToTwoDecimalPlaces = (number)->
		number.round(2)

	sum = (lineItems) ->
		lineItems.sum (lineItem) -> lineItem.price

	getTotal: ->
		sum(@lineItems)

    
module.exports = Receipt