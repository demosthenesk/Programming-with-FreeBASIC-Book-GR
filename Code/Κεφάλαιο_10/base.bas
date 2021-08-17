Type parent
	i As Integer
	Declare Sub show()
End Type

Sub parent.show ()
	This.i = 10
	Print This.i
End Sub

Type child Extends parent
	i As Integer
	Declare Sub show()
End Type

Sub child.show ()
	This.i = 20
	Base.show()
	Print This.i
End Sub

Dim p As parent
p.show

Dim c As child
c.show

Sleep
End

