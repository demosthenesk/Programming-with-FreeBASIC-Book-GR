' define var and pointer
Dim i As Integer, p As Integer Ptr

' setup pointer
p = @i

' write a value to pointer
Poke Integer, p, 420

' get a value from pointer
Print Peek(Integer, p)

Sleep
End
