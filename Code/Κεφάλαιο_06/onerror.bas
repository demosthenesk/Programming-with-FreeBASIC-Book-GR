#lang "fblite"
On Error Goto FAILED
Open "xzxwz.zwz" For Input As #1
On Error Goto 0
Print "Program continue here..."
Sleep
End

FAILED:
Dim e As Integer
e = Err
Print "Error " & e & " on line " & Erl
Resume Next
End
