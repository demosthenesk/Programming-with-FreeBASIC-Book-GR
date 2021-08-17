Dim a As Integer Ptr, b As Integer Ptr, i As Integer

' Allocate memory for 5 integers
a = Allocate( 5 * SizeOf(Integer) )

If a = 0 Then Print "Error Allocating a": End

For i = 0 To 4
' Assign integers to the buffer
  a[i] = (i + 1) * 2
Next i

' Reallocate memory for 5 additional integers
b = Reallocate( a, 10 * SizeOf(Integer) )

If b <> 0 Then
' Discard the old pointer and use the new one    
	a = b   

    For i = 5 To 9
	' Assign more integers to the buffer
      a[i] = (i + 1) * 2
    Next i

    For i = 0 To 9
	' Print the integers
      Print i, a[i]
    Next i
    Print	
Else 
'' Reallocate failed, memory unchanged
    Print "Error Reallocating a"

    For i = 0 To 4
	' Print the integers
      Print i, a[i]
    Next i

    Print
End If
' Clean up
Deallocate a

Sleep
End
