Print "Select a color by number" 
Print "1. blue"
Print "2. red"
Print "3. green"
Dim choice As String
Do
   choice = Input(1)
Loop Until choice >= "1" And choice <= "3"

Print "You choose: "; choice

Sleep
End