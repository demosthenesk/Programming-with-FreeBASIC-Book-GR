Dim a As String
Line Input "Δωστε εναν ακεραιο: ", a
If CInt(a) > 10 Then
	Print "Δωσατε τιμη μεγαλυτερη του 10"
ElseIf CInt(a) < 10 Then
	Print "Δωσατε τιμη μικροτερη του 10"
ElseIf CInt(a) = 10 Then
	Print "Δωσατε τιμη ιση με 10"
End If
Sleep
End

