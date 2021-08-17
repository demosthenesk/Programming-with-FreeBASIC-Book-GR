Dim a As String

Open Cons For Input As #1
Open Cons For Output As #2

Print #2,"Please write something and press ENTER"
Line Input #1,a
Print #2, "You wrote : ";a

Close
Sleep
End
