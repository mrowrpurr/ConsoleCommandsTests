scriptName ConsoleCommandTests_ManageCommands extends ConsoleCommandsTest
{Tests for adding, removing, and editing commands}

function TestSuites()
    describe("Commands", AddingCommandTests())
endFunction

function AddingCommandTests()
    it("can add a command", AddSimpleCommandTest())
    it("can remove a command", RemoveSimpleCommandTest())
    it("can clear all commands", ClearAllCommandsTest())
    ; it("can add aliases for commands")
endFunction

function AddSimpleCommandTest()
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)

    ConsoleCommands.Add("mycommand")

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 1)
    string firstCommandName = ConsoleCommands.Names()[0]
    expectString(firstCommandName, to, beEqualTo, "mycommand")
endFunction

function RemoveSimpleCommandTest()
    ConsoleCommands.Add("mycommand")
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 1)

    ConsoleCommands.Remove("mycommand")

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)
endFunction

function ClearAllCommandsTest()
    ConsoleCommands.Add("hello")
    ConsoleCommands.Add("world")
    ConsoleCommands.Add("hi")
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 3)

    ConsoleCommands.Clear()

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)
endFunction