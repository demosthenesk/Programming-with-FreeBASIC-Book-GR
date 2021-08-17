Dim text As String
text = "abc 123"
Print text 'displays "abc 123"

' replace part of text with another string
Mid(text, 5, 3) = "456" 

Print text 'displays "abc 456"

Sleep
End