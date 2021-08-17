Type car
	speed As Integer
	Declare Constructor()
	Declare Destructor() 
End Type

Constructor car()
	Print "I am in constructor"
	Print "I initialize speed member"
	This.speed = 10
	Print "My car's speed is " & This.speed
End Constructor

Destructor car()
	Print "I am in destructor"
End Destructor

Scope
	Print "I am in scope..."
	Dim mycar As car
End Scope

Print "I am out of scope..."

Sleep
End

