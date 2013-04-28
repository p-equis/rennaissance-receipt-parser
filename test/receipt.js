var should = require("should");
var createReceipt = require("../src/receipt.js").create;

describe("splitting out the restaurant costs", function(){
	it("should subtract asador line items", function(){
		var lineItems = [
						 { name: "room", price: 100 },
						 { name : "asador", price: 24},
						 { name: "parking", price: 100}
						];

		var receipt = createReceipt(lineItems);

		receipt.getTotalWithoutFood().should.equal(200);
	});
});