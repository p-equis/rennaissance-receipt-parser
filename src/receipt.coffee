class Receipt
	constructor: (lineItems) ->
		@lineItems = lineItems

	getTotalWithoutFood: ->
		foodLineItems = ["asador", "rmservic", "club lng"]
		lineItems = @lineItems.filter (lineItem) ->  lineItem.name not in foodLineItems
		prices = lineItems.map (lineItem) -> lineItem.price
		prices.reduce (price1, price2) -> price1 + price2
    
module.exports = Receipt