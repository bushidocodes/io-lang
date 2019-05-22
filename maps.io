elvis := Map clone

// Setting a Key
elvis atPut("home", "Graceland")

// Retrieving the Value associated with a key
elvis at("home") print writeln

elvis atPut("style", "Rock & Roll")

// Casting a Map to an Object
elvis asObject print writeln

// Casting a Map to a list of tuples
elvis asList print writeln

elvis keys print writeln

elvis size print writeln