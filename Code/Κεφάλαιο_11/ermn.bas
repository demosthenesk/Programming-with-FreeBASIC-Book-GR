'' test.bas
'' compile with fbc -exx -lang fblite test.bas

#lang "fblite"

Sub Generate_Error
  On Error Goto Handler
  Error 1000
  Exit Sub
Handler:
  Print "Error Module  : "; *Ermn()
  Resume Next
End Sub

Generate_Error
