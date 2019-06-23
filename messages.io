// Everything but comment markers and the comma is a message in io
// A message has three components: a sender, a target, and arguments

postOffice := Object clone 
writeln("Post Office is: ", postOffice)

// call allows us to inspect the incoming message calling the method
postOffice inspectMessage := method(
    writeln("Post Office got a message from: ", call sender)
    writeln("Post Office got a message with target: ", call target)
    writeln("Post Office got a message with name: ", call message name)
    writeln("Post Office got a message with arguments: ", call message arguments)
)
postOffice packageSender := method(
    writeln("Post Office got a message from: ", call sender)
)
postOffice messageTarget := method(
    writeln("Post Office got a message with a target of: ", call target)
)
postOffice messageArgs := method(
    writeln("Post Office got a message with arguments: ", call message arguments)
)
postOffice messageName := method(
    writeln("Post Office got a message with name: ", call message name)
)

mailer := Object clone
writeln("Mailer is: ", mailer)
mailer deliver := method(postOffice inspectMessage("one", 2, :three))

mailer deliver


unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
        call sender doMessage(call message argAt(1))
    ) ifTrue (
        call sender doMessage(call message argAt(2))
    )
)

unless (1 == 2, write("One is not two\n"), write("One is two\n"))