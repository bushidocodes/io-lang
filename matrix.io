Matrix := Object clone

Matrix init := method(
  self _data := list()
)

Matrix dim := method(x,y, (
  for(i, 1, x, self _data append(list()))
  self _data foreach(list,
    for(j, 1, y, list append(nil))
  )
))

Matrix set := method(x,y,val, (
  self _data at(x) atPut(y, val)
  get(x,y)
))

Matrix get := method(x,y, (
  self _data at(x) at(y)
))

Matrix transpose := method(
  // Get dimensions of current matrix
  x := self _data size
  y := self _data at(0) size
  
  // Size the new matrix with transposed dimensions
  newMatrix := Matrix clone
  newMatrix dim(y,x)

  // Fill out new Matrix, flipping the coordinates
  for(i, 0, x - 1, (
    for(j, 0, y - 1, (
      newMatrix set(j,i, self get(i,j))
    ))
  ))

  newMatrix
)

Matrix serializeToCsv := method(
  self _data map(innerlist, (
    innerlist join(", ")
  )) join("\n")
)

Matrix deserializeFromCsv := method(lines,
  x := lines size
  y := lines at(0) split(", ") size println

  newMatrix := Matrix clone
  newMatrix dim(x,y)

  lines foreach(i, line,
    elems := line split(", ")
    elems foreach(j, elem,
      newMatrix set(i, j, elem)
    ) 
  )
  newMatrix

  // self _data map(innerlist, (
  //   innerlist join(", ")
  // )) join("\n")
)

myMatrix := Matrix clone 
myMatrix dim(3,4)
myMatrix set(1,0,1) println
myMatrix get(1,0) println
two := myMatrix transpose
two get(0,1) println

f := File with("foo.csv")
f remove
f openForUpdating
f write(myMatrix serializeToCsv)
f close

f := File with("foo.csv")
f openForReading
new_matrix := Matrix deserializeFromCsv(f readLines)
new_matrix println

// f readLines size println