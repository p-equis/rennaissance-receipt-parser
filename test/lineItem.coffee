should = require("should")
LineItem = require("../src/LineItem.js")

describe "LineItems", ->
	it "should be food when the description is the asador", ->
		new LineItem("asador").isFood().should.equal true

	it "should not be food when the description is 'parking'", ->
		new LineItem("parking").isFood().should.equal false

	it "should be food when the description is 'club lng'", ->
		new LineItem("club lng").isFood().should.equal true

	it "should be food when the description is 'rmservic'", ->
		new LineItem("rmservic").isFood().should.equal true
