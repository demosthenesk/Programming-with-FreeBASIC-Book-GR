#include "fbthread.bi"

Sub mythread( ByVal param As Any Ptr )
    Print "hi!"
End Sub

Var thread = ThreadCreate( @mythread )

ThreadDetach( thread )
ThreadDetach( ThreadCreate( @mythread ) )

Sleep
End