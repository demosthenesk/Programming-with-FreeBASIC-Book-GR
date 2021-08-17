Dim pPointer1 As Integer Pointer
Dim pPointer2 As Integer Pointer

pPointer1 = Allocate(4 * SizeOf(Integer))
pPointer2 = Allocate(4 * SizeOf(Integer))

Print "Address of pPointer1: "; pPointer1
Print "Address of pPointer2: "; pPointer2

pPointer2 = pPointer1

Print "Address of pPointer1: "; pPointer1
Print "Address of pPointer2: "; pPointer2

Deallocate(pPointer1)
Deallocate(pPointer2)

Sleep
End

