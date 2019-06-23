// To create a Singleton, clone an object and then shadow Object.clone with a method that just returns the object itself
// This works because accessing values and calling anonymous functions are called via the same message passing interface
Highlander := Object clone
Highlander clone := Highlander

one := Highlander clone
two := Highlander clone

"Can there be only one? " print
(one == two) print writeln