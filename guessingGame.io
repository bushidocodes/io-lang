remainingTries := 10
difference := 100
// Random addon is not available in the WASM build; use microsecond time as a low-quality seed
randomNumber := (Date clone now asNumber * 1000000) floor % 100 + 1
"Welcome to the Io Guessing Game" println
"Enter a Number between 1 and 100" println

guess := 99
while (remainingTries > 0,(
  writeln("You have ", remainingTries, " remaining")
  inputLine := File standardInput readLine
  if (inputLine isNil, break)
  guess := inputLine asNumber
  if (guess isNan,
    writeln("Please enter a number.")
  ,
    newDiff := (guess - randomNumber) abs
    if (difference < 100 and newDiff > 0, (
      if (newDiff < difference, "Warmer", "Colder" ) println
    ))
    difference = newDiff
    if (guess == randomNumber,(
      writeln("You win!")
      break
    ))
    remainingTries := remainingTries - 1
    if (remainingTries == 0, "Out of Guesses. You Lose!" println)
  )
))
