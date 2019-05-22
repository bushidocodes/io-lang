
// Lists are io's ordered collection
toDos := list("find my car", "find Continuum Transfuctioner")
toDos type print writeln

// They have a bunch of typical methods for this sort of collection
List() slotNames print writeln

toDos size print writeln // 2
toDos append("Find a present")
toDos size print writeln // 3

// Some of the methods are useful for calculations
"\n=========CALCULATIONS=========\n" print
myNums := list(1,2,3,4)

"Average is " print
myNums average print 
writeln

"Sum is " print
myNums sum print 
writeln

"myNums(1) = " print
myNums at(1) print 
writeln

"Before mutation... " print
myNums print writeln

"After appending 4... " print
myNums append(4) print writeln

"After popping last element... " print
myNums pop // returns the popped value 
myNums print writeln

"After prepending the value 0... " print
myNums prepend(0) print writeln

"Is myNums empty? " print
myNums isEmpty print writeln
"Is list() empty? " print
list() isEmpty print writeln