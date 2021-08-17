Dim MyArray1(1 To 10) As Integer
ReDim MyArray2(1 To 10) As Integer

Print "MyArray1", LBound( MyArray1 ), UBound( MyArray1 )
Print "MyArray2", LBound( MyArray2 ), UBound( MyArray2 )

Erase MyArray1, MyArray2

Print "MyArray1", LBound( MyArray1 ), UBound( MyArray1 )
Print "MyArray2", LBound( MyArray2 ), UBound( MyArray2 )

Sleep
End
