' Create variables for the file number, 
' and the number to put
Dim As Integer f
Dim As Long value

' Find the first free file number
f = FreeFile()

' Open the file "file.ext" for binary usage, 
' using the file number "f"
Open "file.ext" For Binary As #f
  value= 10
  ' Write the bytes of the integer 'value' 
  ' into the file, using file number "f"
  ' starting at the beginning 
  ' of the file (position 1)
  Put #f, 1, value

' Close the file
Close #f
