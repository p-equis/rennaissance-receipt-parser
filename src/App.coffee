class App
	constructor: (dependencies) ->
		@Hotel = dependencies.Hotel
		@console = dependencies.console
		@process = dependencies.process
		@NotARealReceipt = dependencies.NotARealReceipt

		@pathToReceipt = @process.argv[2]

		if(not @pathToReceipt)
			@console.log("\tUsage: expenses <pathToReceipt>\n")
			@process.exit(1)

	generateReport: ->
		try
			hotel = new @Hotel(pathToReceipt: @pathToReceipt)
			@console.log("You should actually expense: $" + hotel.actualExpenses())
		catch error
			if(error instanceof @NotARealReceipt)
				@console.log("That file doesn't look like a real Rennaisance receipt!")
			else
				throw error

module.exports = App