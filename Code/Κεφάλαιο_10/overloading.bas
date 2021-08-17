Type car
	Declare Sub printspeed (i As Integer)
	Declare Sub printspeed (d As Double)
	colour As String
End Type

Sub car.printspeed (i As Integer)
	Print i
End Sub

Sub car.printspeed (d As Double)
	Print d
End Sub

Dim bmw As car
bmw.printspeed(100)
bmw.printspeed(100.5)

Sleep
End

