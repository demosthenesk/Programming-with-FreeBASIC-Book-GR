Type car
Public:
	Declare Sub set_speed(ByVal new_speed As Integer)
	Declare Sub get_speed(ByRef curr_speed As Integer)
	Declare Sub Accelerate()
Private:
	Dim speed As Integer 
End Type

Sub car.set_speed(ByVal new_speed As Integer)
	This.speed = new_speed
End Sub

Sub car.get_speed(ByRef curr_speed As Integer)
	curr_speed = This.speed
End Sub

Sub car.Accelerate ()
	This.speed += 20
End Sub

Dim bmw As car
Dim car_speed As Integer
bmw.set_speed(100)
bmw.get_speed(car_speed)
Print car_speed

bmw.Accelerate()
bmw.get_speed(car_speed)
Print car_speed

Sleep
End

