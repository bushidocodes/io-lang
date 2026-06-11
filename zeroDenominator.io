Number originalDiv := Number getSlot("/")
Number getSlot("/") println
Number newSlot("/", method(one, two, three,
    writeln("from: ", call sender)
    writeln("target: ", call target)
    writeln("name: ", call message name)
    writeln("arguments: ", call message arguments foreach(println))
    writeln("params: ", one, ", ", two, ", ", three)
    self originalDiv(one)
))
num := 2 /(3)
writeln("result: ", num)
