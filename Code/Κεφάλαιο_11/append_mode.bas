Dim i As Integer
For i = 1 To 10
    Open "test.txt" For Append As #1
    Print #1, i; " extending test.txt"
    Close #1
Next
