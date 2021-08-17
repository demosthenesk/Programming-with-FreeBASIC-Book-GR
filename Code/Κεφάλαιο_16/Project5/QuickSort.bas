' quick sort
Sub QuickSort(qs() As Long, l As Long, r As Long)
 
    Dim As ULong size = r - l +1
    If size < 2 Then Exit Sub
 
    Dim As Long i = l, j = r
    Dim As Long pivot = qs(l + size \ 2)
 
    Do
        While qs(i) < pivot
            i += 1
        Wend
        While pivot < qs(j)
            j -= 1
        Wend
        If i <= j Then
            Swap qs(i), qs(j)
            i += 1
            j -= 1
        End If
    Loop Until i > j
 
    If l < j Then quicksort(qs(), l, j)
    If i < r Then quicksort(qs(), i, r) 
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

QuickSort(array(), LBound(array), UBound(array))

Print "Array after sort"
printArray(array())