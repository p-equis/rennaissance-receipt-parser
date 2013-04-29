should = require("should")
LineItem = require("../src/LineItem.js")

describe "LineItems", ->
	it "should be food when the description is the asador", ->
		new LineItem("asador").isFood().should.equal true

	it "should not be food when the description is 'parking'", ->
		new LineItem("parking").isFood().should.equal false
