Const a = 300
#define b 12
Dim c As Single
#if defined(a)
 Print "a is defined"
#endif
#if defined(b)
 Print "b is defined"
#endif
#if defined(c)
 Print "c is defined"
#endif
#if defined(d)
 Print "d is defined"
#Endif

Sleep
End