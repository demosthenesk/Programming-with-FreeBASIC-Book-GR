Sub copyArray(a() As Integer, iBegin As Integer, iEnd As Integer, b() As Integer)
  Redim b(iBegin To iEnd - 1) As Integer
  For k As Integer = iBegin To iEnd - 1
    b(k) = a(k)
  Next
End Sub
 
' Left source half is  a(iBegin  To iMiddle-1).
' Right source half is a(iMiddle To iEnd-1).
' Result is            b(iBegin  To iEnd-1).
Sub topDownMerge(a() As Integer, iBegin As Integer, iMiddle As Integer, iEnd As Integer, b() As Integer)
  Dim i As Integer = iBegin
  Dim j As Integer = iMiddle
 
  ' While there are elements in the left or right runs...
  For k As Integer = iBegin To iEnd - 1 
  ' If left run head exists and is <= existing right run head.
    If i < iMiddle AndAlso (j >= iEnd OrElse a(i) <= a(j)) Then
      b(k) = a(i)
      i += 1
    Else
      b(k) = a(j)
      j += 1    
    End If
  Next 
End Sub
 
' Sort the given run of array a() using array b() as a source.
' iBegin is inclusive; iEnd 
' is exclusive (a(iEnd) is not in the set).
Sub topDownSplitMerge(b() As Integer, iBegin As Integer, iEnd As Integer, a() As Integer)
  If (iEnd - iBegin) < 2 Then Return  '' If run size = 1, consider it sorted
  ' split the run longer than 1 item into halves
  Dim iMiddle As Integer = (iEnd + iBegin) \ 2  '' iMiddle = mid point
  ' recursively sort both runs from array a() into b()
  topDownSplitMerge(a(), iBegin,  iMiddle, b())  '' sort the left  run
  topDownSplitMerge(a(), iMiddle, iEnd, b())     '' sort the right run
  ' merge the resulting runs from array b() into a()
  topDownMerge(b(), iBegin, iMiddle, iEnd, a())
End Sub
 
' Array a() has the items to sort; 
' array b() is a work array (empty initially).      
Sub topDownMergeSort(a() As Integer, b() As Integer, n As Integer)
  copyArray(a(), 0, n, b())  '' duplicate array a() into b()           
  topDownSplitMerge(b(), 0, n, a())  '' sort data from b() into a()
End Sub
 
Sub printArray(a() As Integer)
  For i As Integer = LBound(a) To UBound(a)
    Print Using "####"; a(i);
  Next
  Print
End Sub
 
Dim a(0 To 9) As Integer = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1}
 
Dim b() As Integer
Print "Unsorted : ";
printArray(a())
topDownMergeSort a(), b(), 10
Print "Sorted   : ";
printArray(a())