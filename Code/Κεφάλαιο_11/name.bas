Dim OldName As String
Dim NewName As String
Dim result As Integer 

OldName = "dsc001.jpg"
NewName = "landscape.jpg"

result = Name( OldName, NewName )

If 0 <> result Then 
    Print "error renaming " & oldname & " to " & newname & "."
End If

Sleep
End