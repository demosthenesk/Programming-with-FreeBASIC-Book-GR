Randomize
Dim n As Integer = Int(Rnd * 10) + 1
Dim guess As Integer

Print "Guess which number I've chosen in the range 1 to 10"
Print

Do
  Input " Your guess : "; guess

  If n = guess Then
    Print "Well guessed!"
    End
  End If
  
  If n < guess Then
	Print "The number is smaller..."
  End If

  If n > guess Then
	Print "The number is bigger..."
  End If
Loop