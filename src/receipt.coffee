_ = require("underscore")

create = (lineItems) ->
  getTotalWithoutFood: ->
    foodLineItems = ["asador", "rmservic", "club lng"]
    _.chain(lineItems).filter((lineItem) ->
      lineItem.name not in foodLineItems
    ).reduce((sum, lineItem) ->
      sum + lineItem.price
    , 0).value()

module.exports = create: create