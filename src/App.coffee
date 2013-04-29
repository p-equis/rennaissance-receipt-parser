Hotel = require("./Hotel")

pathToReceipt = process.argv[2]

if(not pathToReceipt) 
	process.stdout.write("   Usage: App.js <pathToReceipt>\n")
	process.exit(1)

hotel = new Hotel(pathToReceipt: pathToReceipt)

console.log("You should actually expense: $" + hotel.actualExpenses())