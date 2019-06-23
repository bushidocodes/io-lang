remainingTries := 10
difference := 100
randomNumber := Random value(0,100) ceil
"Welcome to the Io Guessing Game" println
"Enter a Number between 1 and 100" println

guess := 99
while (remainingTries > 0,(
  writeln("You have ", remainingTries, " remaining")
  guess := File standardInput readLine asNumber
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
))
