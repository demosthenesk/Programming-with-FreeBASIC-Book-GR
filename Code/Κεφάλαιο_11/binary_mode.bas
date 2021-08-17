'' Create a binary data file with one number in it
Dim x As Single = 17.164
Open "MyFile.Dat" For Binary As #1
  '' put without a position setting will 
  '' put from the last known file position
  '' in this case, the very beginning of the file.
  Put #1, , x
Close #1


'' Now read the number from the file
Dim a As Single = 0
Open "MyFile.Dat" For Binary As #1
  Get #1, , a
Close #1

Print a
Sleep
End
