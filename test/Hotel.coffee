should = require("should")
Hotel = require("../src/Hotel.js")
hotel = new Hotel(pathToReceipt: "test/receipt.html")

toleranceDueToNumericalImprecision = .001

describe "Hotel", ->
	it "should calculate how much you're supposed to expense for the hotel, ignoring food items", ->
		hotel.actualExpenses().should.be.approximately 650.31, toleranceDueToNumericalImprecision

	it "should calculate how much the hotel is actually billing, as a sanity check", ->
		hotel.totalBilled().should.be.approximately 695.04, toleranceDueToNumericalImprecision