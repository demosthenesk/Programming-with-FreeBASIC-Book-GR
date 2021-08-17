Dim value As Integer
Dim b As Boolean
b = True 
value = IIf(b, 10, 20)
Print value
b = False
value = IIf(b, 10, 20)
Print value
Sleep
End


