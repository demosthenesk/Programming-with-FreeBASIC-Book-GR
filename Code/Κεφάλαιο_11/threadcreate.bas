'' Threading synchronization using Mutexes
'' If you comment out the lines containing "MutexLock" and "MutexUnlock",
'' the threads will not be in sync and some of the data may be printed
'' out of place.
Const MAX_THREADS = 10
Dim Shared As Any Ptr ttylock
'' Teletype unfurls some text across the screen at a given location
Sub teletype( ByRef text As String, ByVal x As Integer, ByVal y As Integer )
    ''
    '' This MutexLock makes simultaneously running threads wait for each
    '' other, so only one at a time can continue and print output.
    '' Otherwise, their Locates would interfere, since there is only one
    '' cursor.
    ''
    '' It's impossible to predict the order in which threads will arrive
    '' here and which one will be the first to acquire the lock thus
    '' causing the rest to wait.
    ''
    MutexLock ttylock
    For i As Integer = 0 To (Len(text) - 1)
        Locate x, y + i
        Print Chr(text[i])
        Sleep 25, 1
    Next
'' MutexUnlock releases the lock and lets other threads acquire it.
    MutexUnlock ttylock
End Sub

Sub thread( ByVal userdata As Any Ptr )
    Dim As Integer id = CInt(userdata)
    teletype "Thread (" & id & ").........", 1 + id, 1
End Sub

'' Create a mutex to syncronize the threads
ttylock = MutexCreate()
'' Create child threads
Dim As Any Ptr handles(0 To MAX_THREADS-1)
For i As Integer = 0 To MAX_THREADS-1
    handles(i) = ThreadCreate(@thread, CPtr(Any Ptr, i))
    If handles(i) = 0 Then
        Print "Error creating thread:"; i
        Exit For
    End If
Next
'This is the main thread. Now wait until all child threads have finished.
For i As Integer = 0 To MAX_THREADS-1
    If handles(i) <> 0 Then
        ThreadWait(handles(i))
    End If
Next
'' Clean up when finished
MutexDestroy(ttylock)

Sub print_dots(ByRef char As String)
    For i As Integer = 0 To 29
        Print char;
        Sleep CInt(Rnd() * 100), 1
    Next
End Sub

Sub mythread(param As Any Ptr)
    '' Work (other thread)
    print_dots("*")
End Sub

Randomize(Timer())
Print " main thread: ."
Print "other thread: *"
'' Launch another thread
Dim As Any Ptr thread1 = ThreadCreate(@mythread, 0)
'' Work (main thread)
print_dots(".")
'' Wait until other thread has finished, if needed
ThreadWait(thread1)
Print
Sleep
End