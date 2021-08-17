#ifdef __FB_LINUX__
    Dim As String program = "./program"
#else
    Dim As String program = "program.exe"
#endif

Print "Running " & program & "..."
If (Chain(program) <> 0) Then
    Print program & " not found!"
End If

Sleep
End