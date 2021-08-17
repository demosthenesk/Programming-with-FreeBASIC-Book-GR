Sub UsePointer()
	Dim pPointer1 As Integer Pointer
	pPointer1 = Allocate(4)
	Print "Address of pPointer1: "; pPointer1
End Sub

UsePointer()

Sleep
End

