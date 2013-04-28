should = require("should")
Receipt = require("../src/receipt.js")

describe "splitting out the restaurant costs", ->
  it "should subtract asador line items", ->
    receipt = new Receipt([
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

  it "should subtract room service line items", ->
    receipt = new Receipt([
      name: "room"
      price: 150
    ,
      name: "rmservic"
      price: 10
    ,
      name: "parking"
      price: 100
    ])
    receipt.getTotalWithoutFood().should.equal 250

  it "should subtract club lounge line items", ->
    receipt = new Receipt([
        name: "room" 
        price: 100
      ,
        name: "club lng" 
        price: 10
    ])
    receipt.getTotalWithoutFood().should.equal 100

