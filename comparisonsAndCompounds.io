"4 < 5? " print
(4 < 5) print writeln

"4 <= 3? " print
(4 <= 3) print writeln

"true and false? " print
(true and false) print writeln

"true and true? " print
(true and true) print writeln

"true or true? " print
(true or true) print writeln

"true or false? " print
(true or false) print writeln

"4 < 5 and 6 < 7? " print
(4 < 5 and 6 < 7) print writeln

"true and 6? " print
(true and 6) print writeln

# Note that 0 is truthy
"true and 0? " print
(true and 0) print writeln

# True, False, and nil extend Object, but they are singletons
true proto print writeln
true clone print writeln
false clone print writeln
nil clone print writeln