'bubble sort
Sub BubbleSort(array1() As Integer)
    ' sort from lower bound to the highter bound
    Dim As Integer lb = LBound(array1)
    Dim As Integer ub = UBound(array1)
    Dim As Integer done, i
 
    Do
        done = 0
        For i = lb To ub -1
            ' replace "<" with ">" for downwards sort
            If array1(i) > array1(i +1) Then
                Swap array1(i), array1(i +1)
                done = 1
            End If
        Next
    Loop Until done = 0 
End Sub

'print array
Sub printArray(array2() As Integer)
	For i As Integer = 1 To 10
		Print ; array2(i)
	Next
End Sub

'declare an array 
Dim array(1 To 10) As Integer

'Fill array with random integers
For i As Integer = 1 To 10
	Randomize
	'get a random integer from 1 to 10
	array(i) = Int(Rnd * 10) + 1
Next


Print "Array before sort"
printArray(array())

BubbleSort(array())

Print "Array after sort"
printArray(array())