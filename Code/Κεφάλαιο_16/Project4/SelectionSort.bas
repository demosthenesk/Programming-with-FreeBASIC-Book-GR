'selection sort
Sub SelectionSort(arr() As Long)
 
    ' sort from lower bound to the highter bound
    ' array's can have subscript range from -2147483648 to +2147483647
 
    Dim As Long i, j, x
    Dim As Long lb = LBound(arr)
    Dim As Long ub = UBound(arr)
 
    For i = lb To ub -1
        x = i
        For j = i +1 To ub
            If arr(j) < arr(x) Then x = j
        Next
        If x <> i Then
            Swap arr(i), arr(x)
        End If
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

SelectionSort(array())

Print "Array after sort"
printArray(array())