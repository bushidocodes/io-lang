OperatorTable addAssignOperator( ":", "atPutPair" );

SPACES_PER_INDENT := 4

SGMLBuilder := Object clone
SGMLBuilder indentCount := 0

SGMLBuilder atPutPair := method(k, v,
    attribute := Map clone();
    attribute atPut( "k", k );
    attribute atPut( "v", v );
    return(attribute);
);

// curlyBraces is invoked whenever the parser sees { or }
// This converts a json like syntax into an array of tuple-like maps with k,v of SGML attributes
SGMLBuilder curlyBrackets := method(
    attributes := list();
    call message arguments foreach(attributePair, (
      pair := doString(attributePair asString())
      attributes append(pair)
    ));
    return attributes;
);

SGMLBuilder indent := method(
  write(" " repeated(self indentCount * SPACES_PER_INDENT))
)

SGMLBuilder writeTag := method(
  self indent
  writeln("<", call sender doMessage(call message argAt(0)), ">")
)

SGMLBuilder openTag := method(tagName, attributes, (
  self indent
  write("<", call sender doMessage(call message argAt(0)))
  if (attributes != nil, (
    write(" ")
    write(attributes join(" "))
  ))
  writeln(">")
  self indentCount = self indentCount + 1
))

SGMLBuilder closeTag := method(
  self indentCount = self indentCount - 1
  self indent
  writeln("</", call sender doMessage(call message argAt(0)), ">")
)

SGMLBuilder writeText := method(
  self indent
  writeln(call message argAt(0))
)

SGMLBuilder writeList := method(
  openTag("ul")
  call sender doMessage(call message argAt(0)) foreach(arg, (
    openTag("li")
    self indent
    writeln(arg)
    closeTag("li")
  ))
  self indentCount = self indentCount -1
  self indent
  writeln("</ul>")
)

SGMLBuilder hasAttributes := method(targetMessage, (
 targetMessage at(0) asString() findSeq( "curlyBrackets" ) == 0
))

// Object.forward is the mechanism by which Io objects traverse the prototypal inheritance tree. It is invoked when a matching slot is not found on the receiving object. I am shadowing this in SGMLBuilder to treat missing methods as a value that I wish to template into SGML. This is roughly similar to how one can metaprogam using missing_method in Ruby, but it has the consequence that SGMLBuilder loses access to the methods on Object.
SGMLBuilder forward := method(
  missingMethod := call message name
  missingMethodArgs := call message() arguments()

  if (self hasAttributes(missingMethodArgs), (
    attributes := missingMethodArgs removeFirst();
    attributesList := self doMessage(attributes);
    attributeStrings := attributesList map(attr, (
      key := attr at("k") asMutable removePrefix("\"") removeSuffix("\"");
      value := ("\"" .. (attr at("v")) .. "\"");
      result := key .. "=" .. value;
      result;
    ))
    openTag(missingMethod, attributeStrings)
  ),
    openTag(missingMethod)
  )
  
  missingMethodArgs foreach(
    arg,
    // If this is interpreted as a function, this recursively calls the function on SGMLBuilder, which should trigger forward() and template out SGML elements, returning nil.
    content := self doMessage(arg);
    // If this isn't interpreted as a funciton, content will be something other than nil, and we need to execute the appropriate parser
    if (content != nil) then (
      if(content type == "Sequence") then (
        self writeText(content) // Writes out test inside of SGML Tags
      ) elseif(content type == "List") then (
        self writeList(content) // Given an Io list of strings, generates HTML UL and LI tags
      ) else (
        writeln("Unknown Content: ", content)
      )
    )
  )
  closeTag(missingMethod)
)

SGMLBuilder body({"onfocus" : "f(){}", "onredo": "g(){}"},
  header(
    h1("My Awesome Webpage")
  ),
  ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
  ),
  list("Io", "Lua", "JavaScript")
)