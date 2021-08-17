Function Fibonacci (a As Integer) As Integer
	Print "Calculate Fibonacci("; a; ")..."
	If a < 2 Then
		Print "Return "; a
		Return a
	Else
		Print "Call Fibonacci("; (a - 1); " and Fibonacci("; (a - 2); ")"
		Return (Fibonacci(a - 1) + Fibonacci(a - 2))
	End If
End Function

Dim i As Integer
Dim result As Integer
Input "Enter which Fibonacci to find:", i
result = Fibonacci(i)
Print "The "; i; " Fibonacci is: "; result

Sleep
End

