Dim As Long key
Do
	Print "Press any key from keyboard"
    Sleep
    key = GetKey
    Print "key: " & Chr(key) & "=" & key
    Print "Press q for quit"
Loop Until Chr(key) = "q"
End

