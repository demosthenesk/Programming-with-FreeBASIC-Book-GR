Dim f As Integer
f = FreeFile

Open "file.ext" For Binary As #f
Print LOF(f)
Close #f

Sleep
End
