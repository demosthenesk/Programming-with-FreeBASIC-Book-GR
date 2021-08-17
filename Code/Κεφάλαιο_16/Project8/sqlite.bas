
#include once "sqlite3.bi"
' written by ike 2014 -
function callback cdecl (byval NotUsed as any ptr, byval argc as integer, byval argv as zstring ptr ptr, byval colName as zstring ptr ptr) as integer
dim as integer i
dim as string text
? "ARGC:", argc
   for i = 0 to argc - 1
      text = "NULL"
      if( argv[i] <> 0 ) then
         if *argv[i] <> 0 then
            text = *argv[i]
         end if
      end if
      print *colName[i], " = '"; text; "'"
   next i
   print
   function = 0   
end function

dim as sqlite3 ptr db
' If an error occurs, this pointer 
' will point a the created error message.
dim as zstring ptr errMsg 
   
dim as integer rc = sqlite3_open("test.db", @db) 'The connection to the test.db database is created.

if (rc <> SQLITE_OK) then
    ? "Cannot open database:", sqlite3_errmsg(db)
    sqlite3_close(db)
    end 1
end if

dim as string cmd

'These SQL statements create a Cars table and fill it with data. The statements must be separated by semicolons.
cmd = "DROP TABLE IF EXISTS Cars; "
cmd &= "CREATE TABLE Cars(Id INT, Name TEXT, Price INT); "
cmd &= "INSERT INTO Cars VALUES(1, 'Zastava', 7642); "
cmd &= "INSERT INTO Cars VALUES(2, 'Yugo', 3127); "
cmd &= "INSERT INTO Cars VALUES(3, 'Skoda', 4000); "
cmd &= "INSERT INTO Cars VALUES(4, 'Volvo', 9000); "
cmd &= "INSERT INTO Cars VALUES(5, 'Cadillac', 5000); "
cmd &= "INSERT INTO Cars VALUES(6, 'Jeep', 1000); "
cmd &= "INSERT INTO Cars VALUES(7, 'GAZ', 1400); "
cmd &= "INSERT INTO Cars VALUES(8, 'VAZ', 1600);"

dim as zstring ptr sql1 = strptr(cmd)

rc = sqlite3_exec(db, sql1, 0, 0, @errmsg)

if (rc <> SQLITE_OK ) then
    ? "SQL error: ", errmsg
    sqlite3_free(errmsg)     
    sqlite3_close(db)
end if

' read db
dim as zstring ptr sql2 = @"SELECT * FROM Cars;"

rc = sqlite3_exec (db, sql2, @callback, 0, @errmsg)

if (rc <> SQLITE_OK ) then
    ? "Failed to select data SQL error: ", errmsg
    sqlite3_free(errmsg)
    sqlite3_close(db)
    end 1
end if

sqlite3_close(db)

? "done"
Sleep
End