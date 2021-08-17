#include "vbcompat.bi"

Dim filename As String, d As Double

Print "Enter a filename: "
Line Input filename

If FileExists( filename ) Then
  Print "File last modified: ";
  d = FileDateTime( filename )
  Print Format( d, "yyyy-mm-dd hh:mm AM/PM" )
Else
  Print "File not found"
End If

Sleep
End