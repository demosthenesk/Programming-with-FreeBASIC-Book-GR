#include "vbcompat.bi"

Dim filename As String
Print "Enter a filename: "
Line Input filename

If FileExists( filename ) Then
  Print "File found: " & filename
Else
  Print "File not found: " & filename
End If

Sleep
End