// io is a prototype-based language like JavaScript or lua
// Everything is expressed as objects and messages passed to objects

// We create an object by cloning an existing object, such as the base Object
// This creates a new empty object chained to Object as a prototype
Vehicle := Object clone

// Objects store other objects and callable objects (methods) in slots
// We use the walrus operator to declare and initialize a new slot 
Vehicle description := "Something to take you places"
// We use the = operator to update an existing slot
Vehicle description = "Something to take you far away"

// Vehicle thisSlotDoesNotExist = "Throws an Exception because this statement did just use a Walrus"
//   Exception: Slot thisSlotDoesNotExist not found. Must define slot using := operator before updating.
//   ---------
//   updateSlot                          vehicles.io 14
//   CLI doFile                           Z_CLI.io 140
//   CLI run                              IoState_runCLI() 1

// to access data from a slot
Vehicle description print writeln
"\n==================\n" print

// The statements in io process similar to a LISP
// ((Vehicle description) print)
// 1. the message description is set to the Vehicle object
// 2. The Vehicle object returns the Immutable String object "Something to take you far away"
// 3. The message print is sent to the immutable string object
// 4. The immutable string object doesn't have a print slot, so it defers up the prototype chain
// 5. The base Object prototype has a print, which the immutable string executes
// 4. The message is output to STDOUT

// Base functionality such as print is merely a callable object (method) stored in a slot on the base Object prototype
Object slotNames print writeln
"\n==================\n" print

// The prototype inheritance chain is saved to the type slot
Vehicle type print writeln // Vehicle has prototype Object
Object type print writeln // Object has prototype Object
"\n==================\n" print

// From the point of view of an object, the prototype inheritance chain to a singly-linked linked list that terminates in a
// object that has itself as its type. This is typically the base Object prototype

// From the point of view of the language, prototypal inheritance is a forest of trees,
// each with directed edges pointing upwards from leaves a root, wich is an object with itself as its type

// Let's extend the chain further
Car := Vehicle clone
Car slotNames print writeln // list(type)
Car type print writeln // Car
"\n==================\n" print

// Object -> Vehicle -> Car -> porsche
// Except an object created with a lowercase name does not actually have a type slot, which means passing a type message goes up the prototypal 
// inheritance chain

porsche := Car clone
porsche slotNames print writeln// list()
porsche type print writeln// Car
"\n==================\n" print

// The meaning of this semantic difference is that a capitalized object is inteded for use as a prototype
// and a non-capitalized object is intended to be treated as an instance of that prototype
// This is a loose convention that allows for some OOP-like behaviors

// In io, methods are callable objects
method() type print writeln // Block
Block type print writeln // 

// We can store them in slots in the prototype inheritance chain. If we add upstream to something like the Car prototype, all protypes and
// instances that delegate to Car will have access to the method
Car drive := method("vroom" print writeln)
porsche drive // vroom

// We have some tools to inspect object and their slots

// We can look at an objects immediate prototype (only one hop up the inheritance chain)
"porsche's proto has: \n" print
porsche proto print

// Or we can look up slots form any arbirary point up the inheritance chain
porsche getSlot("drive") print // This delegates up to Car
porsche getSlot("description") print // This delegates up to Vehicle
"\n==================\n" print

// The global namespace is the Lobby. It is the default message receiver
Lobby type print writeln
type print // Object

// Any methods that the Lobby can delegate to can be executed in a procedural-like manner
writeln
