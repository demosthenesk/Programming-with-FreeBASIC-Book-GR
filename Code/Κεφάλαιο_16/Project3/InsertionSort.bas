' insertion sort
Sub InsertionSort( arr() As Long )
 
  ' sort from lower bound to the highter bound
  ' array's can have subscript range from -2147483648 to +2147483647
 
  Dim As Long lb = LBound(arr)
  Dim As Long i, j, value
 
  For i = lb +1 To UBound(arr)
 
    value = arr(i)
    j = i -1
    While j >= lb  And arr(j) > value
      arr(j +1) = arr(j)
      j = j -1
    Wend
 
    arr(j +1) = value
  Next
End Sub

'print array
Sub printArray(array2() As Long)
	For i As Integer = 1 To 10
		Print ; array2(i)
	Next
End Sub

'declare an array 
Dim array(1 To 10) As Long

'Fill array with random integers
For i As Integer = 1 To 10
	Randomize
	'get a random integer from 1 to 10
	array(i) = Int(Rnd * 10) + 1
Next


Print "Array before sort"
printArray(array())

InsertionSort(array())

Print "Array after sort"
printArray(array())
