'' This example uses Open Pipe to run a shell command and retrieve its output. 
#ifdef __FB_UNIX__
Const TEST_COMMAND = "ls -al *"
#else
Const TEST_COMMAND = "dir *.*"
#endif

Open Pipe TEST_COMMAND For Input As #1

Dim As String ln
Do Until EOF(1)
    Line Input #1, ln
    Print ln
Loop

Sleep
Close #1
End
