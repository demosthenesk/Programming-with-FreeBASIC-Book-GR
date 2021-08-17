Dim a As String
Open Err For Input  As #1
Print #1,"Please write something and press ENTER"
Line Input #1, a 
Print #1, "You wrote: "; a
Close
Sleep
End
