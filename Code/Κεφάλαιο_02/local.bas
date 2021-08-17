'' visible only in this module
Dim As Integer local_moduleLevel1 = 10
'' OK.
Print local_moduleLevel1
Scope
  '' OK; SCOPE Blocks inherit outer scope
  Print local_moduleLevel1
  
  '' visible only in this SCOPE Block
  Dim As Integer local_moduleLevel2 = 20
  '' OK.
  Print local_moduleLevel2
End Scope
'' Error; can't see inner-SCOPE vars
'' print local_moduleLevel2
Function some_function( ) As Integer
  '' visible only in this function
  Dim As Integer local_functionLevel=30
  '' OK.
  Print local_functionLevel
  '' Error; can't see local module-level vars  
  '' print local_moduleLevel1
  '' Error; can't see local module-level vars
  '' print local_moduleLevel2
  Function = 0
End Function
'' print local_functionLevel
'' Error; can't see function_level vars
Sleep
End 0
  
