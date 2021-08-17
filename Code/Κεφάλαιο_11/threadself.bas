#include "fbthread.bi"

Dim As Any Ptr phandle(1 To 10)

Sub myThread (ByVal p As Any Ptr)
    Print "Thread handle: " & ThreadSelf()
End Sub

For I As Integer = 1 To 10
    phandle(I) = ThreadCreate(@myThread)
Next I

For I As Integer = 1 To 10
    ThreadWait(phandle(I))
Next I

Sleep
End