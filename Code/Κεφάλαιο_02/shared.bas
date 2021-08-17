'' visible throughout this module
Dim Shared As Integer shared_moduleLevel1 = 10
'' OK.
Print shared_moduleLevel1
Scope
  '' OK; can see outer-scope vars
  Print shared_moduleLevel1
  
  '' Error; SCOPE-level vars cannot be shared
  '' dim shared as integer shared_ModuleLevel2
End Scope

Function some_function( ) As Integer
  '' OK; can see shared module-level vars
  Print shared_moduleLevel1
  '' Error; function-level vars cannot be shared  
  '' dim shared as integer sharedFunctionLevel
  Function = 0
End Function

Sleep
End

