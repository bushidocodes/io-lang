// The way to create a Singleton in io is cloning and object and then creating a local clone method that shadows Object.clone
// This local clone method should just return its object
Highlander := Object clone
Highlander clone := Highlander

one := Highlander clone
two := Highlander clone

"Can there be only one? " print
(one == two) print writeln