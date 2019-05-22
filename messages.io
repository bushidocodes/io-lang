// Everything but comment markers and the comma is a message in io
// A message has three components: a sender, a target, and arguments

"Post Office is: " print
postOffice := Object clone println

// call gives up meta information about a message

// Whenever the post office receives the message packageSender, print the message sender to the screen
postOffice packageSender := method("Post Office got a message from: " print; call sender println)

"Mailer is: " print
mailer := Object clone println
mailer deliver := method(postOffice packageSender)


mailer deliver

// Whenever the post office receives the message messageTarget, print the message target to the screen
// This will be the ID of the post office
postOffice messageTarget := method("Post Office got a message with a target of: " print; call target println)

postOffice messageTarget


// Get the message name and arguments
postOffice messageArgs := method(call message arguments println)
postOffice messageName := method(call message name println)

postOffice messageArgs("one", 2, :three)

postOffice messageName

unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
        call sender doMessage(call message argAt(1))
    ) ifTrue (
        call sender doMessage(call message argAt(2))
    )
)

unless (1 == 2, write("One is not two\n"), write("One is two\n"))