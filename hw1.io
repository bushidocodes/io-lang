// Is io strongly typed or weakly typed?

// io seems to be strongly typed
// I can't implicity mix types

writeln(1 type)
writeln(1.1 type)
my_num := 1 / 2
writeln(my_num)
writeln(1 + 1) 

// 1 + "one" print
// writeln

// Is 0 true or false?
writeln("true and 0? ", true and 0)

// Is an empty string true or false?
writeln("true and ''? ", true and "")

// How can you tell what slots a prototype supports?
writeln(Lobby slotNames)


// What is the difference between = := and ::=? When would you use each one?

// := is to assign to a new slot
thingie := "wazzup"
// = is to update the value of an existing slot
thingie = "nutin"

// ::= is used to define slots with setters on a prototype
Student := Object clone
Student name ::= nil
Student address ::= nil
Student greet := method(writeln("Hi!"))
new_student := Student clone setName("Sean") setAddress("Camellia st.")
writeln(new_student name) 
new_student greet