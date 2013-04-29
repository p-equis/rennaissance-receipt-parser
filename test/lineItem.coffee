should = require("should")
LineItem = require("../src/LineItem.js")

describe "LineItems", ->
	it "should be food when the description is the asador", ->
		new LineItem(
			description: "asador"
			price: 1
		).isFood().should.equal true

	it "should not be food when the description is 'parking'", ->
		new LineItem(
			description: "parking"
			price: 1
		).isFood().should.equal false

	it "should be food when the description is 'club lng'", ->
		new LineItem(
			description: "club lng"
			price: 10
		).isFood().should.equal true

	it "should be food when the description is 'rmservic'", ->
		new LineItem(
			description: "rmservic"
			price: 10
		).isFood().should.equal true

	it "should have a price", ->
		new LineItem(
			price: 10
			description: "something"
		).price.should.equal 10
