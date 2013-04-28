var _ = require("underscore");

module.exports = {
	create: function(lineItems){
		return {
			getTotalWithoutFood: function() {
				return _.chain(lineItems)
					.filter(function(lineItem) { return lineItem.name != "asador"; })
					.reduce(function(sum, lineItem) { return sum + lineItem.price; }, 0)
					.value();
			}
		};
	}
};