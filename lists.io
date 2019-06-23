
// Lists are io's ordered collection
toDos := list("find my car", "find Continuum Transfuctioner")
writeln(toDos type)

// They have a bunch of typical methods for this sort of collection
writeln(List() slotNames)

writeln(toDos size) // 2
toDos append("Find a present")
writeln(toDos size) // 3

// Some of the methods are useful for calculations
"\n=========CALCULATIONS=========\n" print
myNums := list(1,2,3,4)

writeln("Average is ", myNums average)
writeln("Sum is ", myNums sum)
writeln("myNums(1) = ", myNums at(1))

writeln("Before mutation... ", myNums)
writeln("After appending 5... ", myNums append(5))

myNums pop // returns the popped value 
writeln("After popping last element... ", myNums)

writeln("After prepending the value 0... ", myNums prepend(0))

writeln("Is myNums empty? ", myNums isEmpty)
writeln("Is list() empty? ", list() isEmpty)