' Allocate and initialize 
' space for 10 integer elements.
Dim p As Integer Ptr = CAllocate(10, SizeOf(Integer))

' Fill the memory with integer values.
For index As Integer = 0 To 9
    p[index] = (index + 1) * 10
Next

' Display the integer values.
For index As Integer = 0 To 9
    Print p[index] ;
Next

' Free the memory.
Deallocate(p)

Sleep
End
