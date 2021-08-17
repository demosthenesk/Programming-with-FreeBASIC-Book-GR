Dim i As Integer
For i = 0 To 10
	Print i
	If i = 5 Then Goto OutOfFor
Next i

OutOfFor:
	Print "I am out of FOR...NEXT now."

Print "Next lines continue here."
Sleep
End

