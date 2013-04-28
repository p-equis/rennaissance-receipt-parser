var should = require("should");
var createReceipt = require("../src/receipt.js").create;

describe("splitting out the restaurant costs", function(){
	it("should subtract asador line items", function(){
		var receipt = createReceipt([
						 { name: "room", price: 100 },
						 { name : "asador", price: 24},
						 { name: "parking", price: 100}
						]);

		receipt.getTotalWithoutFood().should.equal(200);
	});

	it("should ignore case", function(){
		var receipt = createReceipt([
						 { name: "room", price: 100 },
						 { name : "ASADOR", price: 24},
						 { name: "parking", price: 100}
						]);

		receipt.getTotalWithoutFood().should.equal(200);
	});

	it("should ignore extra whitespace on the line item name", function(){
		var receipt = createReceipt([
						 { name: "room", price: 100 },
						 { name : "  asador   ", price: 24},
						 { name: "parking", price: 200}
						]);

		receipt.getTotalWithoutFood().should.equal(300);
	});
});