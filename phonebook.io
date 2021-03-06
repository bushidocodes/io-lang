// Make the : an operator so we can parse JSON kv-pairs
OperatorTable addAssignOperator(":", "atPutNumber")

// Because atPut already stringifies the key, we string the extra quotes
Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

// Fires whenever the parser encounters curly brackets
curlyBrackets := method (
  writeln("Parsing curly brackets")
  r := Map clone
  call message arguments foreach(arg, 
    writeln("An arg: ", arg)
    r doMessage(arg)
  )
  r
)

s := File with("phonebook.json") openForReading contents
// doString evaluates text as Io source code
phoneNumbers := doString(s)

phoneNumbers keys println
phoneNumbers values println