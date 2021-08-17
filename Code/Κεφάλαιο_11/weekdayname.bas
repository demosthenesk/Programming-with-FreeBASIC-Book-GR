#include "vbcompat.bi"

Dim a As Double = DateSerial(2005, 11, 28) + TimeSerial(7, 30, 50)

Print Format(a, "yyyy/mm/dd hh:mm:ss "); WeekdayName(Weekday(a))

Sleep
End
