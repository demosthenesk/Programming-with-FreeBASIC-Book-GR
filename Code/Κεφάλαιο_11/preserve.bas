ReDim array(1 To 3) As Integer
array(1) = 10
array(2) = 5
array(3) = 8

ReDim Preserve array(1 To 10)

Dim i As Integer
For i = 1 To 10
    Print "array("; i; ") = "; array(i)
Next

Sleep
End

