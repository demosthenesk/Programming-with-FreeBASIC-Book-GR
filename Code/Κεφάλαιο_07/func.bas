Function AddNumbers Overload (a As Integer, b As Integer) As Integer
	Return a + b
End Function

Function AddNumbers Overload (a As Double, b As Double) As Double
	Return a + b
End Function

Dim i As Integer
Dim d As Double

i = AddNumbers(10, 5)
Print i
d = AddNumbers(10.3, 5.4)
Print d

Sleep
End

