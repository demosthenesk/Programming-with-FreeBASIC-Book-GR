#include "vbcompat.bi"

Dim d As Double

d = Now()

Print "Today is day " & DatePart( "y", d );
Print " in week " & DatePart( "ww", d );
Print " of the year " & DatePart( "yyyy", d )

Sleep
End
