should = require("should")
LineItemParser = require("../src/LineItemParser.js")
NotARealReceipt = require("../src/NotARealReceipt.js")
fileSystem = require("fs")
_ = require("underscore")

html = fileSystem.readFileSync("test/receipt.html", "utf8")
parser = new LineItemParser(html)

describe "LineItemParser", ->
	it "should find the right number of line items in all that mess", ->
		parser.parse().length.should.equal 45

	it "should extract the description", ->
		_.chain(parser.parse())
		.where(description: "room tr")
		.value()
		.length.should.equal 6

	it "should associate the price with the description", ->
		_.chain(parser.parse())
		.where(description: "room tr")
		.first()
		.value()
		.price.should.equal 85

	it "should skip the header", -> 
		firstItem = _.first(parser.parse())
		firstItem.description.should.equal "telecomm" 	

	it "should throw a useful exception when the html can't be parsed", ->
		creation = -> 
			new LineItemParser("this isn't really html")

		creation.should.throw(NotARealReceipt)	