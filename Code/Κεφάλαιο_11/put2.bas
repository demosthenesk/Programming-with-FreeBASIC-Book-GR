' Create an integer array
Dim buffer(1 To 10) As Integer

For i As Integer = 1 To 10
    buffer(i) = i
Next

' Find the first free file file number
Dim f As Integer
f = FreeFile()

' Open the file "file.ext" for 
' binary usage, using the file number "f"
Open "file.ext" For Binary As #f

' Write the array into the file, 
' using file number "f"
' starting at the beginning 
' of the file (position 1)
Put #f, 1, buffer()

' Close the file
Close #f
