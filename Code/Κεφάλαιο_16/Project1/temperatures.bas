Function FarToCel(F As Double) As Double
	Return (5/9*(F-32))
End Function

Function CelToFar (C As Double) As Double
	Return (C*9/5+32)
End Function

Dim inputTemperature As Double = 0.0
Dim iChoice As Integer = 0

Do
	Print "Choose an option:"
	Print "1 For Fahrenheit To Celsius"
	Print "2 For Celsius To Fahrenheit"
	Print "3 For exit..."
	Input iChoice
	
	Select Case iChoice
	Case 1
		Input "Input temperature in Fahrenheit: ", inputTemperature
		Print "C= " ; FarToCel(inputTemperature)
	Case 2
		Input "Input temperature in Celsius: ", inputTemperature
		Print "F= " ; CelToFar(inputTemperature)
	Case 3
		Exit Do
	End Select
Loop