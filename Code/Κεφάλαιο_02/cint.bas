'Create an INTEGER variable
Dim numeric_value As Integer
'Convert a numeric value
numeric_value = CInt(300.5)
'Print the result, should return 300, 
'because 300 is even
Print numeric_value

numeric_value = CInt(301.5)
'Print the result, should return 302, 
'because 301 is odd
Print numeric_value
Sleep
End

