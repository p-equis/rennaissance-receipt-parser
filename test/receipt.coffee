should = require("should")
Receipt = require("../src/receipt.js")

describe "splitting out the restaurant costs", ->
  it "should subtract food line items", ->
    receipt = new Receipt([
      isFood: -> false
      price: -> 100
    ,
      isFood: -> true
      price: -> 24
    ,
      isFood: -> false
      price: -> 100
    ])
    receipt.getTotalWithoutFood().should.equal 200
