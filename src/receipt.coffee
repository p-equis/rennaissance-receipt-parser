_ = require("underscore")

create = (lineItems) ->
  getTotalWithoutFood: ->
    foodLineItems = ["asador", "rmservic"]
    _.chain(lineItems).filter((lineItem) ->
      foodLineItems.indexOf(lineItem.name.toLowerCase().trim()) is -1
    ).reduce((sum, lineItem) ->
      sum + lineItem.price
    , 0).value()

module.exports = create: create