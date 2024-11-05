REM  *****  BASIC  *****
REM SyntaxHighlightGambas3
'This macro is a syntax higjlighter for selected text in OO documents for Gamba3 code.
'author Demosthenes Koptsis demosthenesk@gmail.com

'BUGS

'TODO
'Highlight Functions

Option Explicit

'Const colorCOMMENTS As Long = 8421504 'Grey
'Const colorOPERATORS As Long = 255  'Blue1
'Const colorKEYWORDS As Long = 33023  'Blue2
'Const colorDATATYPES As Long = 33023  'Blue2
'Const colorSYMBOLS As Long = 255 'Blue1
'Const colorNUMBERS As Long = 16711680 'Red
'Const colorSTRINGS As Long = 16711935 'Purple

Dim sFontName As String
Dim fFontHeight As Double

Dim colorCOMMENTS As Long  'Grey
Dim colorOPERATORS As Long 'Blue1
Dim colorKEYWORDS As Long  'Blue2
Dim colorDATATYPES As Long 'Blue2
Dim colorSYMBOLS As Long   'Blue1
Dim colorNUMBERS As Long   'Red
Dim colorSTRINGS As Long   'Purple


Const sComment As String = "'"
Const sQuoteMark As String = """"


Dim bInString As Boolean 'set true if cursor is in a string
Dim iInString As Integer

Dim sKeywords() As String
Dim sFunctions() As String
Dim sStringFunctions() As String
Dim sDatatypes() As String
Dim sOperators() As String
Dim sSymbols() As String
'Dim sClasses(404) As String 'not done yet


Sub Init()

'declare the FreeBASIC keywords, symbols, functions, etc
sKeywords = Array("#Else", "#Endif", "#If", "APPEND", "AS", "BREAK", "BYREF", "CASE", "CATCH", "CLASS", "CLOSE", "CONST", "CONTINUE", "COPY", _
            "CREATE", "DEBUG", "DEC", "DEFAULT", "DIM", "DIV", "DOWNTO", _
            "DO", "EACH", "ELSE", "END", "ENDIF", "ENDS", "ENUM", "ERROR", _
            "EVENT", "EXEC", "EXPORT", "EXTERN", "FALSE", "FINALLY", "FLUSH", "FOR", "FUNCTION", "GOTO", "IF", "IN", "INC", "INHERITS", _
            "INPUT", "FROM", "IS", "KILL", "LAST", "LIBRARY", "LIKE", "LINE", "LINK", "LOCK", "LOOP", "MEMORY", "ME", _
            "MKDIR", "MOVE", "NEW", "NEXT", "NULL", "OPEN", "OPTIONAL", "OUTPUT", "PIPE", "PRINT", "PRIVATE", _
            "PROCEDURE", "PROPERTY", "PUBLIC", "QUIT", "RAISE", "RANDOMIZE", "READ", "REPEAT", "RETURN", "RMDIR", _
            "SEEK", "SELECT", "SHELL", "SLEEP", "STATIC", "STEP", "STOP", "STRUCT", "SUB", "SUPER", "SWAP", "THEN", "TO", _
            "TRUE", "TRY", "UNLOCK", "UNTIL", "WAIT", "WATCH", "WEND", "WHILE", "WITH", "WRITE", "TYPE", "DELETE", "DECLARE", _
            "EXTENDS", "ABSTRACT", "VIRTUAL", "OVERRIDE", "CONSTRUCTOR", "BYVAL", "BYREF")

sFunctions = Array("Abs", "Access", "Acos", "Acosh", "Alloc", "Ang", "Asc", "ASin", "ASinh", "Asl", "Asr", "Atan", _
            "ATan2", "ATanh", _
            "BChg", "BClr", "Bin", "Bool@", "Boolean@", "BSet", "BTst", "Byte@", _
            "CBool", "Cbr", "CByte", "CDate", "Ceil", "CFloat", "Choose", "Chr", "CInt", "CLong", "Comp", "Conv", "Cos", _
            "Cosh", "CShort", "CSingle", "CSng", "CStr", _
            "Date", "DateAdd", "DateDiff", "Day", "DConv", "Deg", "DFree", "Dir", _
            "Eof", "Eval", "Exist", "Exp", "Exp10", "Exp2", "Expm", _
            "Fix", "Float@", "Floor", "Format", "Frac", "Free", _
            "Hex", "Hour", "Html", "Hyp", _
            "Iif", "InStr", "Int", "Int@", "Integer@", "IsAscii", "IsBlank", "IsBoolean", "IsByte", "IsDate", "IsDigit", "IsDir", _
            "IsFloat", "IsHexa", "IsInteger", "IsLCase", "IsLetter", "IsLong", "IsNull", "IsNumber", "IsObject", _
            "IsPunct", "IsSpace", "IsUCase", "IsShort", "IsSingle", "IsSpace", "IsString", "IsUCase", "IsVariant", _
            "LCase", "Left", "Len", "Lof", "Log", "Log10", "Log2", "Logp", "Long@", "Lsl", "Lsr", "LTrim", _
            "Mag", "Max", "Mid", "Min", "Minute", "Month", "Now", "Pointer@", "Quote", _
            "Rad", "RDir", "Realloc", "Replace", "Right", "RInStr", "Rnd", "Rol", "Ror", "Round", "RTrim", _
            "Scan", "SConv", "Second", "Seek", "Sgn", "Shell", "Shl", "Short@", "Shr", "Sin", "Single@", "Sinh", "SizeOf", "Space", "Split", "Sqr", _
            "Stat", "Str", "String", "String@", "StrPtr", "Subst", _
            "Tan", "Tanh", "Temp", "Time", "Timer", "Tr", "Trim", "TypeOf", _
            "UCase", "Unquote", "Val", "VarPtr", "Week", "WeekDay", "Year")


sDatatypes = Array("Boolean", "Byte", "Short", "Integer", "Long", "Single", "Float", "Date", "String", "Variant", "Object", _
            "Pointer", "File", "Ptr")

sOperators = Array("AND", "BEGINS", "DIV", "MOD", "NOT", "OR", "XOR")

sSymbols = Array("&", "*", "+", "-", "/", "=", "\", "^", "[", "]", "{", "}", "<", ">", ",", ".", ";")


'get color value as Long
'Dim lColor As Long
'lColor = RGB(255,0,255)
'msgbox lColor
'exit sub

colorCOMMENTS = RGB(128,128,128) 'Grey
colorOPERATORS = RGB(0,0,255)    'Blue1
colorKEYWORDS = RGB(0,128,255)   'Blue2
colorDATATYPES = RGB(0,128,255)  'Blue2
colorSYMBOLS = RGB(0,0,255)      'Blue1
colorNUMBERS = RGB(255,0,0)      'Red
colorSTRINGS = RGB(255,0,255)    'Purple

sFontName = "Garamond"
fFontHeight = 10


End Sub


Sub HighLight()

Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

Init()

Doc = ThisComponent
oCurSelection = ThisComponent.getCurrentSelection()   
oTextRange = oCurSelection.getByIndex(0)
Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'if something is selected

'set font, font size
'UNCOMMENT TO SET FONT
Cursor.CharFontName = sFontName
Cursor.CharHeight = fFontHeight

'---- Highlight single words
HighLight_SingleWords()

'---- Highlight Classes Datatypes
HighLight_DatatypeClasses()

'---- Highlight Numbers
HighLight_Numbers()

'---- Highlight Char
HighLight_Char()

'---- Highlight Datatype Brackets
HighLight_DtBrackets()

MsgBox "Finish highlighting!"


End Sub

Sub HighLight_Char()


Dim Pos As Integer
Dim iLenOfText As Integer
Dim sLetter As String
Dim i As integer

Dim sPChar As String 'previous char
Dim bIsChar As Boolean

Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

  Doc = ThisComponent
  oCurSelection = ThisComponent.getCurrentSelection()   
  oTextRange = oCurSelection.getByIndex(0)
  Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'if something is selected
  Cursor.gotoStart(False) 'goto Start of text
  Cursor.gotoEnd(True) 'select all text
  iLenOfText = Len(Cursor.String) 'count len of text

  Cursor.gotoStart(False) 'goto start of text
  Pos=1

  Do
    'get a character
    Cursor.goRight(1, True)
    sLetter = Mid(Cursor.String, 1, 1)
    


'Highlight Numbers---------------------------------------------------------------------

'    if IsNumeric(sLetter) AND sLetter <> "" AND sLetter <> " " AND Cursor.CharColor <> colorCOMMENTS Then
'       Cursor.goLeft(2, False) 'go to previous char
'       Cursor.goRight(1, True) 'select this char
'       sPChar = Cursor.String
'
'       bIsChar = IsChar(sPChar) 'check if previous char is accepted character
'      
'       Cursor.goRight(1, False) 'go next char
'       Cursor.goLeft(1, False) 'go previous
'       Cursor.goRight(1, True) 'select next char. This position must me the number char position
'       
'       sLetter = Cursor.String
'       
'       if Cursor.String <> " " AND bIsChar = False AND (sPChar = "_" OR sPChar = "+"  OR sPChar = "-" OR sPChar = "*" OR sPChar = "/" OR sPChar = "\" OR sPChar = "^" OR sPChar = "$" OR sPChar = "?" OR sPChar = Chr(32) OR IsNumeric(sPChar) = True OR sPChar = "(" OR sPChar = "[" OR sPChar = ".") Then
'          Cursor.CharColor = colorNUMBERS 'set character color                  
'       end if
'    
'    end if
   
'-------------------------------------------------------------------------------------


'HighLight Symbols -------------------------------------------------------------------
    'Highlight Parenthesis
    if sLetter = "(" OR sLetter = ")" AND Cursor.CharColor <> colorCOMMENTS  Then
        Cursor.CharColor = colorSYMBOLS 'set character color           
        Cursor.CharWeight = com.sun.star.awt.FontWeight.BOLD  'set character weight           
    end if
   
   'Highlight Symbols
    For i = LBound(sSymbols) To Ubound(sSymbols)
     if sLetter = sSymbols(i) AND Cursor.CharColor <> colorCOMMENTS  Then
        Cursor.CharColor = colorSYMBOLS 'set character color           
        Cursor.CharWeight = com.sun.star.awt.FontWeight.BOLD  'set character weight           
     end if
    Next i
'------------------------------------------------------------------------------------


'Highlight Strings-------------------------------------------------------------------

    if sLetter=sQuoteMark Then
       bInString = True
       iInString = iInString + 1
       Cursor.CharColor = colorSTRINGS 'set character color
       Cursor.CharWeight = com.sun.star.awt.FontWeight.NORMAL  'set character weight                                
    end if   
   
    if bInString=True AND iInString < 2 AND Cursor.CharColor <> colorCOMMENTS Then 'the start of a string
       Cursor.CharColor = colorSTRINGS 'set character color                  
       Cursor.CharWeight = com.sun.star.awt.FontWeight.NORMAL  'set character weight                                
    end if

    if iInString = 2 Then
       bInString = False
       iInString = 0       
    end if
'------------------------------------------------------------------------------------

    Cursor.goLeft(1, False) 'unselect character
    Cursor.goRight(1, False) 

    Pos = Pos + 1
  Loop Until Pos > iLenOfText


End Sub




Sub HighLight_Numbers()

Dim Pos As Integer
Dim iLenOfText As Integer
Dim sLetter As String
Dim sPChar As String 'previous char
Dim bIsChar As Boolean


Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

Doc = ThisComponent
oCurSelection = ThisComponent.getCurrentSelection()   
oTextRange = oCurSelection.getByIndex(0)
Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'if something is selected

  Cursor.gotoStart(False) 'goto Start of text
  Cursor.gotoEnd(True) 'select all text
  iLenOfText = Len(Cursor.String) 'count len of text

  Cursor.gotoStart(False) 'goto start of text
  Pos=1

  Do
    'get a character
    Cursor.goRight(1, True)
    sLetter = Mid(Cursor.String, 1, 1)
    
    'Highlight Numbers
    if IsNumeric(sLetter) AND sLetter <> "" AND sLetter <> " " AND Cursor.CharColor <> colorCOMMENTS Then
       Cursor.goLeft(2, False) 'go to previous char
       Cursor.goRight(1, True) 'select this char
       sPChar = Cursor.String

       bIsChar = IsChar(sPChar) 'check if previous char is accepted character
      
       Cursor.goRight(1, False) 'go next char
       Cursor.goLeft(1, False) 'go previous
       Cursor.goRight(1, True) 'select next char. This position must me the number char position
       
       
       if Cursor.String <> " " AND bIsChar = False AND (sPChar = "_" OR sPChar = "+"  OR sPChar = "-" OR sPChar = "*" OR sPChar = "/" OR sPChar = "\" OR sPChar = "^" OR sPChar = "$" OR sPChar = "?" OR sPChar = Chr(32) OR IsNumeric(sPChar) = True OR sPChar = "(" OR sPChar = "[" OR sPChar = ".") Then
          Cursor.CharColor = colorNUMBERS 'set character color                  
       end if
    
    end if
    
    
    Cursor.goLeft(1, False) 'unselect character
    Cursor.goRight(1, False) 

    Pos = Pos + 1
  Loop Until Pos > iLenOfText

End Sub


Function IsChar(sChar As String) As Boolean

Dim bResult As Boolean
Dim i As Integer
Dim sChars(25) As String
  sChars(0) = "q"
  sChars(1) = "w"
  sChars(2) = "e"
  sChars(3) = "r"
  sChars(4) = "t"
  sChars(5) = "y"
  sChars(6) = "u"
  sChars(7) = "i"
  sChars(8) = "o"
  sChars(9) = "p"
  sChars(10) = "a"
  sChars(11) = "s"
  sChars(12) = "d"
  sChars(13) = "f"
  sChars(14) = "g"
  sChars(15) = "h"
  sChars(16) = "j"
  sChars(17) = "k"
  sChars(18) = "l"
  sChars(19) = "z"
  sChars(20) = "x"
  sChars(21) = "c"
  sChars(22) = "v"
  sChars(23) = "b"
  sChars(24) = "n"
  sChars(25) = "m"
'  sChars(26) = "("
'  sChars(27) = "["
  

  For i=0 To UBound(sChars)
      
      if LCase(sChars(i)) = LCase(sChar) Then
        bResult = True
        Exit For
      else
        bResult = False
      end if  
  Next i

  IsChar = bResult

End Function






Sub HighLight_DatatypeClasses()

Dim Proceed As Boolean
Dim sLetter As String
Dim sWord as String
'Dim iCounter As Integer
Dim sNW1 As String 'next word1 AS
Dim sNW2 As String 'next word2 NEW

Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

Doc = ThisComponent
oCurSelection = ThisComponent.getCurrentSelection()   
oTextRange = oCurSelection.getByIndex(0)
Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'get a each word from selected text
Cursor.gotoStart(False)
'get each word
Do
 Cursor.gotoEndOfWord(True)

    'DATATYPES Classes match
    if Cursor.String <> "" Then

       sLetter = Mid(Trim(Cursor.String), 1, 1) 'get first letter from word
'       sWord = Mid(Trim(Cursor.String), 1, 3)
'       MsgBox "Cursor: " & Cursor.String & " sLetter: " & sLetter & " sWord: " & sWord      
       
'       if UCase(Trim(sWord)) <> "REM" AND sLetter <> "'" AND Cursor.CharColor <> colorCOMMENTS Then
       if sLetter <> "'" AND Cursor.CharColor <> colorCOMMENTS Then
                
         if Trim(Ucase(Cursor.String)) = "AS" Then
            Cursor.gotoNextWord(False)
            Cursor.gotoEndofWord(True)
            sNW1 = Cursor.String 'get next word after AS
            
            if UCase(sNW1) = "NEW" Then
               Cursor.gotoNextWord(False)
               Cursor.gotoEndofWord(True)
               Cursor.CharColor = colorDATATYPES 'set word color
            else
               Cursor.gotoStartofWord(False)
               Cursor.gotoEndofWord(True)
               Cursor.CharColor = colorDATATYPES 'set word color                                      
            end if
         
         end if
                
       end if
              
    end if

    Proceed = Cursor.gotoNextWord(False)
'Loop While Cursor.isAtEndOfParagraph = False
Loop While Proceed


End Sub





Sub HighLight_SingleWords()

Dim Proceed As Boolean
Dim sLetter As String
'Dim sWord as String
Dim iCounter As Integer

Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

Doc = ThisComponent
oCurSelection = ThisComponent.getCurrentSelection()   
oTextRange = oCurSelection.getByIndex(0)
Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'get each word from selected text
Cursor.gotoStart(False)

'get each word
Do
 Cursor.gotoEndOfWord(True)
 
' msgbox Cursor.String


     'if first word is REM this is a comment line. Until end of paragraph apply COMMENTS
'     sWord = Mid(Trim(Cursor.String), 1, 3)
'     if UCase(sWord) = "REM" Then
'        Cursor.gotoStartOfParagraph(False) 'reset cursor to start of line
'        Cursor.gotoEndOfParagraph(True) 'set cursor to end of line
'        Cursor.CharColor = colorCOMMENTS 'set line color
'        Cursor.CharPosture = com.sun.star.awt.FontSlant.ITALIC 'make line ITALIC
'     end if       
 
    'COMMENTS Whole line comments
    'if word starts with ' this is a comment line. Until end of paragraph apply COMMENTS
    sLetter = Mid(Trim(Cursor.String), 1, 1) 'get first letter from word   
    if sLetter = sComment Then
       Cursor.gotoStartofParagraph(False)   'set cursor to start of line
       Cursor.gotoEndOfParagraph(True) 'set cursor to end of line, and select line until the end
       Cursor.CharColor = colorCOMMENTS 'set line color
       Cursor.CharPosture = com.sun.star.awt.FontSlant.ITALIC 'make line ITALIC
    end if 


    'OPERATORS match
    if Cursor.String <> "" Then
       
       For iCounter = LBound(sOperators) To UBound(sOperators)
              
           if Ucase(sOperators(iCounter)) = Trim(Ucase(Cursor.String)) Then
             'if word is equal with a string in sOperators this word is an operator 
             Cursor.CharColor = colorOPERATORS 'set word color           
             Cursor.CharWeight = com.sun.star.awt.FontWeight.BOLD  'set word weight           
           end if
       Next iCounter 'next element in Array

    'KEYWORDS match       
       For iCounter = LBound(sKeyWords) To UBound(sKeyWords)
              
           if Ucase(sKeyWords(iCounter)) = Trim(Ucase(Cursor.String)) Then
             'if word is equal with a string in sKeyWords this word is a keyword 
             Cursor.CharColor = colorKEYWORDS 'set word color           
             Cursor.CharWeight = com.sun.star.awt.FontWeight.BOLD  'set word weight           
           end if
       Next iCounter 'next element in Array

    'DATATYPES match       
       For iCounter = LBound(sDataTypes) To UBound(sDataTypes)
              
           if Ucase(sDataTypes(iCounter)) = Trim(Ucase(Cursor.String)) Then
             'if word is equal with a string in sDatatypes this word is a datatype 
             Cursor.CharColor = colorDATATYPES 'set word color           
           end if
       Next iCounter 'next element in Array


    'COMMENTS inside Line (Paragraph)
       Cursor.gotoStartofWord(False) 'move cursor to the Start of Word
       Cursor.goLeft(1, True) 'move cursor 1 letter left
        
       'if word starts with ' this is a comment line. Until end of paragraph apply COMMENTS
       sLetter = Mid(Trim(Cursor.String), 1, 1) 'get first letter from word   
       if sLetter = sComment Then
          Cursor.goLeft(1, False)
          Cursor.gotoEndOfParagraph(True) 'set cursor to end of line, and select line until the end
          Cursor.CharColor = colorCOMMENTS 'set line color
          Cursor.CharPosture = com.sun.star.awt.FontSlant.ITALIC 'make line ITALIC
          Cursor.CharWeight = com.sun.star.awt.FontWeight.NORMAL  'set word weight           
          Cursor.gotoNextWord(True)
       end if
        
       'reset cursor potition
       Cursor.goRight(1, False)

    end if    
    
    Proceed = Cursor.gotoNextWord(False)
Loop While Proceed

End Sub




Sub HighLight_DtBrackets()

Dim Proceed As Boolean
Dim sLetter As String
Dim iCounter As Integer

Dim Doc As Object
Dim oCurSelection As Object
Dim oTextRange As Object
Dim Cursor As Object

Doc = ThisComponent
oCurSelection = ThisComponent.getCurrentSelection()   
oTextRange = oCurSelection.getByIndex(0)
Cursor = oTextRange.getText.createTextCursorByRange(oTextRange) 

'if nothing is selected exit sub
if Cursor.String = "" then
   Beep
   MsgBox "Nothing selected. Please select some text first!"
   Exit Sub
EndIf

'get each word from selected text
Cursor.gotoStart(False)

'get each word

Do
 Cursor.gotoEndOfWord(True)

    'DATATYPES match       
       For iCounter = LBound(sDataTypes) To UBound(sDataTypes)
            
          'if word is equal with a string in sDatatypes this word is a datatype
           if Ucase(sDataTypes(iCounter)) = Trim(Ucase(Cursor.String)) Then
                         
             'get next character after datatype
             Cursor.goRight(1, False)
             Cursor.goLeft(1, False)
             Cursor.goRight(1, True)
             sLetter = Cursor.String
                          
             if sLetter = "[" Then
                Cursor.CharColor = colorDATATYPES 'set word color
                
                'loop until closing bracket
                Do
                  Cursor.goRight(1, False)
                  Cursor.goLeft(1, False)
                  Cursor.goRight(1, True) 'select next char
                  sLetter = Cursor.String
                                    
                  if sLetter = "]" Then
                     Cursor.CharColor = colorDATATYPES 'set word color             
                  end if                 
                  
                Loop Until sLetter = "]"           
                
             end if
             
             'unselect character
             Cursor.goLeft(1, False)
             Cursor.goRight(1, False)
                          
           end if
       Next iCounter 'next element in Array

    Proceed = Cursor.gotoNextWord(False)
Loop While Proceed


End Sub


