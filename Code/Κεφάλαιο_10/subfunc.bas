Type foo
	Declare Sub f (As Integer)
	Declare Function g As Integer
    i As Integer
End Type

Sub foo.f (n As Integer)
    Print n
End Sub

Function foo.g () As Integer
    Return 420
End Function

Dim bar As foo
bar.f (5)
bar.i = bar.g()
Print bar.i

Sleep
End

