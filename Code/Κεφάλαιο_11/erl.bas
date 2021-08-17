' compile with -lang fblite or qb

#lang "fblite"

' note: compilation with '-ex' option is required

On Error Goto ErrorHandler

' Generate an explicit error
Error 100

End

ErrorHandler:
  Dim num As Integer = Err
  Print "Error "; num; " on line "; Erl
  Sleep
  Resume Next
