Dim last As Integer
Dim first As Integer
Dim number As Integer

first = 1
last = 10

Randomize
For i As Integer = 1 To 10
	number = Rnd * (last - first) + first
	Print number
Next

Sleep
End
