Dim As Byte Ptr lpBuffer
Dim As Integer hFile, Counter, Size
Size = 256
lpBuffer = Allocate(Size)

For Counter = 0 To Size-1
  lpBuffer[Counter] = (Counter And &HFF)
Next

' Get free file file number
hFile = FreeFile()

' Open the file "test.bin" in binary writing mode
Open "test.bin" For Binary Access Write As #hFile
  ' Write 256 bytes from 
  ' the memory pointed to by lpBuffer
  Put #hFile, , lpBuffer[0], Size

' Close the file
Close #hFile

' Free the allocated memory
Deallocate lpBuffer
