Dim As Long foo
Do
    foo = GetKey
    Print "total return: " & foo
    
    If( foo > 255 ) Then
        Print "extended code: " & (foo And &hff)
        Print "regular code: " & (foo Shr 8)
    Else
        Print "regular code: " & (foo And &hff)
    End If
    Print 
' loop until ESCAPE pressed
Loop Until foo = 27

Sleep
End