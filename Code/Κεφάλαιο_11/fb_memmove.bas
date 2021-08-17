Dim As ZString * 33 z = "memmove can be very useful......"

Print z

fb_memmove(z[20], z[15], 11)

Print z

Sleep
End