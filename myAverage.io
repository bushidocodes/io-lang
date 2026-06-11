List myAverage := method(
  foreach(elem,
    if (elem type != "Number") then(
      Exception raise("Cannot take average on list with non-numerics")
    )
  )
  if (size == 0, Exception raise("Cannot take average of empty list"))
  (sum / size)
)

myList := List clone append(1,2,3,4)
myList myAverage println