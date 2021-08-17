Dim Shared As Any Ptr mutex
Dim Shared As Any Ptr cond
Dim Shared As String txt
Dim As Any Ptr pt
Dim Shared As Integer ok = 0

Sub thread (ByVal p As Any Ptr)
    Print "thread is complementing the string"
    MutexLock(mutex)
    Sleep 400, 1
    txt &= " complemented by thread"
    ok = 1
    CondSignal(cond)
    MutexUnlock(mutex)
    Print "thread signals the processing completed"
End Sub

mutex = Mutexcreate
cond = CondCreate
txt = "example of text"

Print "main() initializes a string = " & txt
Print "main creates one thread"
Print

pt = ThreadCreate(@thread)
MutexLock(mutex)

While ok <> 1
    CondWait(cond, mutex)
Wend

Print
Print "back in main(), the string = " & txt
ok = 0

MutexUnlock(mutex)
ThreadWait(pt)
MutexDestroy(mutex)
CondDestroy(cond)

Sleep
End