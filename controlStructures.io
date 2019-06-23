
// Infinite Loop
// loop("getting dizzy..." println)

// While Loop
i := 1
while (i <= 11, (
    i println; 
    i = i + 1;
))
"This one goes up to 11" println

// For Loop
for (i, 1, 11, i println)
"This one goes up to 11" println

// For Loop with optional increment value
for (i, 1, 11, 2, i println)
"This one goes up to 11" println

if (true, 
    "It is true", 
    "It is false"
) println

if (false, 
    "It is true", 
    "It is false"
) println

if true then (
    "It is true" println
) else (
    "It is false" println
)

// if (false) then(
//     "It is true" println
// ) else(
//     "It is false" println
// )