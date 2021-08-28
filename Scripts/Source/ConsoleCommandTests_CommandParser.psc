scriptName ConsoleCommandTests_CommandParser extends Quest
{Tests for the command parser}

; function TestSuites()
;     describe("Parsing simple arguments", ParsingSimpleArguments())
;     describe("Parsing commands", ParsingCommandTests())
;     ; describe("Parsing subcommands")
;     ; describe("Parsing flags")
;     ; describe("Parsing options")
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Arguments
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; function ParsingSimpleArguments()
;     it("can parse empty example", EmptyCommandTest())
;     it("can parse one argument", NoCommand_OneArgument())
;     it("can parse multiple arguments", NoCommand_MultipleArguments())
;     it("parser ignores extra spaces", NoCommand_MultipleArguments_ExtraSpaces())
;     it("can parse one double quoted argument", NoCommand_DoubleQuotes_One())
;     it("can parse a first argument double quoted", NoCommand_DoubleQuotes_First())
;     it("can parse a last argument double quoted", NoCommand_DoubleQuotes_Last())
;     it("can parse a middle argument double quoted", NoCommand_DoubleQuotes_Middle())
; endFunction

; function EmptyCommandTest()
;     int result = ConsoleCommandParser.Parse("")
    
;     expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, true)
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 0)
; endFunction

; function NoCommand_OneArgument()
;     int result = ConsoleCommandParser.Parse("hello")
    
;     expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 1)
;     expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
; endFunction

; function NoCommand_MultipleArguments()
;     int result = ConsoleCommandParser.Parse("hello world")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello world")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
;     expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArguments(result)[1], to, beEqualTo, "world")
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
; endFunction

; function NoCommand_MultipleArguments_ExtraSpaces()
;     int result = ConsoleCommandParser.Parse(" hello      world   hi    ")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, " hello      world   hi    ")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 3)
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
;     expectString(ConsoleCommandParser.GetArgument(result, 2), to, beEqualTo, "hi")
; endFunction

; function NoCommand_DoubleQuotes_One()
;     int result = ConsoleCommandParser.Parse("\"hello\"")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "\"hello\"")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 1)
;     expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
; endFunction

; function NoCommand_DoubleQuotes_First()
;     int result = ConsoleCommandParser.Parse("\"hello\" world")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "\"hello\" world")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
; endFunction

; function NoCommand_DoubleQuotes_Last()
;     int result = ConsoleCommandParser.Parse("hello \"world\"")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello \"world\"")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
; endFunction

; function NoCommand_DoubleQuotes_Middle()
;     int result = ConsoleCommandParser.Parse("hello \"world\" hi")
    
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello \"world\" hi")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 3)
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
;     expectString(ConsoleCommandParser.GetArgument(result, 2), to, beEqualTo, "hi")
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Commands
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; function ParsingCommandTests()
;     it("can parse a single command without arguments", Command_NoArguments())
;     it("can parse a single command with arguments", Command_Arguments())
; endFunction

; function Command_NoArguments()
;     int command = ConsoleCommands.Add("hello")

;     int result = ConsoleCommandParser.Parse("hello")

;     expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 0)
;     expectString(ConsoleCommandParser.GetCommand(result), to, beEqualTo, "hello")
;     expectInt(ConsoleCommandParser.IdForCommand(result), to, beEqualTo, command)
; endFunction

; function Command_Arguments()
;     int command = ConsoleCommands.Add("hello")

;     int result = ConsoleCommandParser.Parse("hello world hi")

;     expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello world hi")
;     expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
;     expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "world")
;     expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "hi")
;     expectString(ConsoleCommandParser.GetCommand(result), to, beEqualTo, "hello")
;     expectInt(ConsoleCommandParser.IdForCommand(result), to, beEqualTo, command)
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Subcommands
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Flags
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Options
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
