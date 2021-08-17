'A Windows based example but 
'the same idea applies to Linux
Const exename = "NoSuchProgram.exe"
Const cmdline = "arg1 arg2 arg3"

Dim result As Integer
result = Exec( exename, cmdline )

If result = -1 Then
    Print "Error running "; exename
Else
    Print "Exit code:"; result
End If