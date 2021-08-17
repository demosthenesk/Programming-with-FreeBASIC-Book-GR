Type car
	speed As Integer
	Declare Sub getspeed ()
End Type

Sub car.getspeed ()
	Print This.speed
End Sub

Dim bmw As car
Dim porche As car

bmw.speed = 100
bmw.getspeed

porche.speed = 200
porche.getspeed

Sleep
End

