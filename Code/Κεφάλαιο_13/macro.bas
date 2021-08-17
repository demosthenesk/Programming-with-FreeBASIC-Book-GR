' macro as an expression value
#macro Print1( a, b )
    a + b
#endmacro

Print Print1( "Hello ", "World!" )    

' macro as multiple statements
#macro Print2( a, b )
    Print a;
    Print " ";
    Print b;
    Print "!"
#endmacro

Print2( "Hello", "World" )

Sleep
End