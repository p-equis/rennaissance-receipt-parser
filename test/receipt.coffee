should = require("should")
createReceipt = require("../src/receipt.js").create
describe "splitting out the restaurant costs", ->
  it "should subtract asador line items", ->
    receipt = createReceipt([
      name: "room"
      price: 100
    ,
      name: "asador"
      price: 24
    ,
      name: "parking"
      price: 100
    ])
    receipt.getTotalWithoutFood().should.equal 200

  it "should ignore case", ->
    receipt = createReceipt([
      name: "room"
      price: 100
    ,
      name: "ASADOR"
      price: 24
    ,
      name: "parking"
      price: 100
    ])
    receipt.getTotalWithoutFood().should.equal 200

  it "should ignore extra whitespace on the line item name", ->
    receipt = createReceipt([
      name: "room"
      price: 100
    ,
      name: "  asador   "
      price: 24
    ,
      name: "parking"
      price: 200
    ])
    receipt.getTotalWithoutFood().should.equal 300

  it "should subtract room service line items", ->
    receipt = createReceipt([
      name: "room"
      price: 150
    ,
      name: "RMSERVIC"
      price: 10
    ,
      name: "parking"
      price: 100
    ])
    receipt.getTotalWithoutFood().should.equal 250

