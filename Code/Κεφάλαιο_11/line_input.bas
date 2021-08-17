Dim s As String

Open "myfile.txt" For Output As #1
Print #1, "Hello, World"
Close #1

Open "myfile.txt" For Input As #1
Line Input #1, s
Close #1

Print s

Sleep
End
