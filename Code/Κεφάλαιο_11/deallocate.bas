'' initialize pointer 
'' to new memory address
Dim As Integer Ptr integerPtr = Allocate( Len( Integer ) )
'' use pointer
*integerPtr = 420
Print *integerPtr
'' free memory back to system
Deallocate( integerPtr )
'' and zero the pointer
integerPtr = 0
End