Type rect
    x As Integer
    y As Integer
End Type

Dim r As rect
Dim rp As rect Pointer = @r

rp->x = 4
rp->y = 2

Print "x = " & rp->x & ", y = " & rp->y
Print "x = " & (*rp).x & ", y = " & (*rp).y
Sleep
End

