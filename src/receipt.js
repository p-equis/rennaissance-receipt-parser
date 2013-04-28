var _ = require("underscore");

var create = function(lineItems){
	return {
		getTotalWithoutFood: function() {
			var foodLineItems = ["asador", "rmservic"];

			return _.chain(lineItems)
				.filter(function(lineItem) { 
					return foodLineItems.indexOf(lineItem.name.toLowerCase().trim()) == -1;
				})
				.reduce(function(sum, lineItem) { return sum + lineItem.price; }, 0)
				.value();
		}
	};
};

module.exports = {
	create: create
};