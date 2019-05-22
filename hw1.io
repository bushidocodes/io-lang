// Is io strongly typed or weakly typed?

// io seems to be strongly typed
// I can't implicity mix types

1 type print
1.1 type print
my_num := 1 /2
my_num print
writeln
(1 + 1) print
writeln

// 1 + "one" print
// writeln

// Is 0 true or false?
"true and 0? " print
(true and 0) print writeln


// Is an empty string true or false?
"true and ''? " print
(true and "") print writeln

// How can you tell what slots a prototype supports?
Lobby slotNames print writeln


// What is the difference between = := and ::=? When would you use each one?

// := is to assign to a new slot
thingie := "wazzup"
// = is to update the value of an existing slot
thingie = "nutin"

// ::= is used to define slots with setters on a prototype
Student := Object clone
Student name ::= nil
Student address ::= nil
Student greet := method("Hi!" print writeln)
new_student := Student clone setName("Sean") setAddress("Camellia st.")
new_student name print writeln
new_student greet