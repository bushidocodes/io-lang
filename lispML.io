// Hijacking forward, the method used for prototypal inheritance to call HTML as io functions
Builder := Object clone
Builder forward := method(
  writeln("<", call message name, ">")
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(content))
  )
  writeln("</", call message name, ">")
)

Builder ul(
  li("Io"),
  li("LuA"),
  li("JavaScript")
)