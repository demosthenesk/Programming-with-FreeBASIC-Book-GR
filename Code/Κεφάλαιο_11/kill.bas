Dim filename As String = "file.ext"
Dim result As Integer = Kill( filename )
If result <> 0 Then Print "error trying to kill " ; filename ; " !"

Sleep
End