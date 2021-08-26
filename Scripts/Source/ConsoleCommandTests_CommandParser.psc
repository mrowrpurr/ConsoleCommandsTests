scriptName ConsoleCommandTests_CommandParser extends Lilac
{Tests for the command parser}

function TestSuites()
    MiscUtil.WriteToFile("Data\\TESTING.txt", "RUNNING TESTS\n", append = false)
    describe("Parsing simple arguments", ParsingSimpleArguments())
    ; describe("Parsing commands", ParsingCommandTests())
    ; describe("Parsing subcommands")
    ; describe("Parsing flags")
    ; describe("Parsing options")
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arguments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function ParsingSimpleArguments()
    it("empty example", EmptyCommandTest())
    it("one argument", NoCommand_OneArgument())
    it("multiple arguments", NoCommand_MultipleArguments())
    it("extra spaces", NoCommand_MultipleArguments_ExtraSpaces())
    it("one double quoted argument", NoCommand_DoubleQuotes_One())
    it("first argument double quoted", NoCommand_DoubleQuotes_First())
    it("last argument double quoted", NoCommand_DoubleQuotes_Last())
    it("middle argument double quoted", NoCommand_DoubleQuotes_Middle())
endFunction

function EmptyCommandTest()
    int result = ConsoleCommandParser.Parse("")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, true)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 0)
endFunction

function NoCommand_OneArgument()
    int result = ConsoleCommandParser.Parse("hello")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 1)
    expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
endFunction

function NoCommand_MultipleArguments()
    int result = ConsoleCommandParser.Parse("hello world")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello world")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
    expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArguments(result)[1], to, beEqualTo, "world")
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
endFunction

function NoCommand_MultipleArguments_ExtraSpaces()
    int result = ConsoleCommandParser.Parse(" hello      world   hi    ")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, " hello      world   hi    ")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 3)
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
    expectString(ConsoleCommandParser.GetArgument(result, 2), to, beEqualTo, "hi")
endFunction

function NoCommand_DoubleQuotes_One()
    int result = ConsoleCommandParser.Parse("\"hello\"")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "\"hello\"")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 1)
    expectString(ConsoleCommandParser.GetArguments(result)[0], to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
endFunction

function NoCommand_DoubleQuotes_First()
    int result = ConsoleCommandParser.Parse("\"hello\" world")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "\"hello\" world")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
endFunction

function NoCommand_DoubleQuotes_Last()
    int result = ConsoleCommandParser.Parse("hello \"world\"")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello \"world\"")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 2)
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
endFunction

function NoCommand_DoubleQuotes_Middle()
    int result = ConsoleCommandParser.Parse("hello \"world\" hi")
    
    expectBool(ConsoleCommandParser.IsEmpty(result), to, beEqualTo, false)
    expectString(ConsoleCommandParser.GetText(result), to, beEqualTo, "hello \"world\" hi")
    expectInt(ConsoleCommandParser.GetArguments(result).Length, to, beEqualTo, 3)
    expectString(ConsoleCommandParser.GetArgument(result, 0), to, beEqualTo, "hello")
    expectString(ConsoleCommandParser.GetArgument(result, 1), to, beEqualTo, "world")
    expectString(ConsoleCommandParser.GetArgument(result, 2), to, beEqualTo, "hi")
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Subcommands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
