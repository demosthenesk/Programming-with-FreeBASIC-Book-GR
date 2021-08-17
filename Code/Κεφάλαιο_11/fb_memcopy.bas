' Define a UDT
Type Person
    Dim As ZString * 40 Name
    Dim As Integer age
End Type

' Declare a pointer and UDT objects
Dim As ZString Ptr mynameptr = @"Pierre de Fermat"
Dim As Person person1, person2

' using fb_memcopy to copy string
fb_memcopy(person1.name, *mynameptr, Len(*mynameptr) + 1)
person1.age = 46

' using fb_memcopy to copy structure
fb_memcopy(person2, person1, SizeOf(Person))

Print person2.name, person2.age
Sleep
End