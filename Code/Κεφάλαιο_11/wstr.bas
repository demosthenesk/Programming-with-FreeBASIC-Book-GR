Dim zs As ZString * 20
Dim ws As WString * 20
zs = "Hello World"
ws = WStr(zs)

Print ws
Print WStr("Unicode 'Hello World'")

Sleep
End