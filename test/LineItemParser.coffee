should = require("should")
LineItemParser = require("../src/LineItemParser.js")
fileSystem = require("fs")
_ = require("underscore")

parser = new LineItemParser()
html = fileSystem.readFileSync("test/receipt.html", "utf8")

describe "LineItemParser", ->
	it "should find the right number of line items in all that mess", ->
		parser.parse(html).length.should.equal 46

	it "should read the description correctly", ->
		_.where(parser.parse(html), description: "ROOM TR").length.should.equal 6