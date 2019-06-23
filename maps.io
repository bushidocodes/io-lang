elvis := Map clone

// Setting some K-V Pairs
elvis atPut("home", "Graceland")
elvis atPut("style", "Rock & Roll")

// Retrieving the Value associated with a key
writeln(elvis at("home"))

// Casting a Map to an Object
elvis asObject print writeln

// Casting a Map to a list of tuples
writeln(elvis asList)

// List keys
writeln(elvis keys)

// Number of K-V Pairs
writeln(elvis size)