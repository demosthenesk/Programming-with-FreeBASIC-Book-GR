Dim f As Single, i As Integer
f = 1.125
i = CVI(f)
Print Using "i = _&H&"; Hex(i)
Print Using "cvs(i) = &"; CVS(i)

Sleep
End