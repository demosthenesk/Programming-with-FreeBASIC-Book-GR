'' Compile with -lang fblite or qb

#lang "fblite"

On Error Goto Error_Handler
Error 150
End

Error_Handler:
  n = Err()
  Print "Error #"; n
  Resume Next
