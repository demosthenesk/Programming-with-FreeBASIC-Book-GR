Dim d As Double, l As LongInt
d = 1.125
l = CVLongInt(d)
Print Using "l = _&H&"; Hex(l)
Print Using "cvd(i) = &"; CVD(l)

Sleep
End