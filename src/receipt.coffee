class Receipt
	constructor: (lineItems) ->
		@lineItems = lineItems

	getTotalWithoutFood: ->
		lineItems = @lineItems.filter (lineItem) -> not lineItem.isFood()
		prices = lineItems.map (lineItem) -> lineItem.price
		prices.reduce (price1, price2) -> price1 + price2
    
module.exports = Receipt