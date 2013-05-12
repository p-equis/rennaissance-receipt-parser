should = require("should")
Receipt = require("../src/receipt.js")

describe "Receipt", ->
  it "should subtract food line items", ->
    receipt = new Receipt([
      isFood: -> false
      price: 100
    ,
      isFood: -> true
      price: 24
    ,
      isFood: -> false
      price:  100
    ])
    receipt.getTotalWithoutFood().should.equal 200

  it "should include everything in unadjusted costs", ->
    receipt = new Receipt([
      price: 100
    ,
      price: 24
    ,
      price:  100
    ])
    receipt.getTotal().should.equal 224

  it "should round to the nearest penny", ->
    receipt = new Receipt([
        price: 100.010101
        isFood: -> false
      ,
        price: 100.02
        isFood: -> false
      ])
    receipt.getTotalWithoutFood().should.equal 200.03
