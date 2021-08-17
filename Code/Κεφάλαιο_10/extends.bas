Type car
	speed As Integer
	colour As String
End Type

Type StarCar Extends car
	brake As String
End Type

Dim bmw As car
bmw.colour = "Red"
bmw.speed = 100

Dim starBMW As StarCar
starBMW.colour = "White"
starBMW.speed = 120
starBMW.brake = "ABS"

Print starBMW.brake

Sleep
End

