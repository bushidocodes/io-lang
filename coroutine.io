odd := Object clone
odd numbers := method(
  1 println
  yield
  3 println
  yield
)

even := Object clone
even numbers := method(
  yield
  2 println
  yield
  4 println
)

odd @@numbers 
even @@numbers

Coroutine currentCoroutine pause