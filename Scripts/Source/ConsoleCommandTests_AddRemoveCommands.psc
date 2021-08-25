Scriptname ConsoleCommandTests_AddRemoveCommands extends Lilac
{Tests for adding and removing commands.}

function TestSuites()
    describe("Adding commands", AddingCommandTests())
    ; describe("Removing commands")
endFunction

function AddingCommandTests()
    it("can add a command", AddSimpleCommand())
endFunction

function AddSimpleCommand()
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)

    ConsoleCommands.Add("mycommand")
    JValue.writeToFile(ConsoleCommandsPrivateAPI.GetInstance().Data, "TESTING-CONSOLE-COMMANDS.json")

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 1)
    string firstCommandName = ConsoleCommands.Names()[0]
    expectString(firstCommandName, to, beEqualTo, "mycommand")
endFunction
