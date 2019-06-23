fib := Object clone
fib compute := method(nthValue, (
  if (nthValue == 1 or nthValue == 2, 
    1, 
    self compute(nthValue - 1) + self compute(nthValue - 2)
  )
))

fib compute(8) println