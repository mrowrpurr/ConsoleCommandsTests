scriptName ConsoleCommandTests_ManageSubcommands extends ConsoleCommandsTest
{Tests for adding, removing, and editing subcommands}

function TestSuites()
    describe("Subcommands", SubcommandTests())
endFunction

function SubcommandTests()
    it("can add a subcommand", AddSubcommandTest())
    it("can remove a subcommand", RemoveSubcommandTest())
    ; it("can add multiple subcommands")
    ; it("can add a subcommand to a subcommand")
    ; it("can add aliases for subcommands")
    ; it("can add a subcommand to a command using command alias")
endFunction

function AddSubcommandTest()
    ConsoleCommands.Add("greetings")
    expectInt(ConsoleCommands.SubcommandNames("greetings").Length, to, beEqualTo, 0)

    ConsoleCommands.AddSubcommand("greetings", "hello")

    expectInt(ConsoleCommands.SubcommandNames("greetings").Length, to, beEqualTo, 1)
    expectString(ConsoleCommands.SubcommandNames("greetings")[0], to, beEqualTo, "hello")
endFunction

function RemoveSubcommandTest()
    ConsoleCommands.Add("greetings")
    ConsoleCommands.AddSubcommand("greetings", "hello")
    expectInt(ConsoleCommands.SubcommandNames("greetings").Length, to, beEqualTo, 1)
    expectString(ConsoleCommands.SubcommandNames("greetings")[0], to, beEqualTo, "hello")

    ConsoleCommands.RemoveSubcommand("greetings", "hello")

    expectInt(ConsoleCommands.SubcommandNames("greetings").Length, to, beEqualTo, 0)
endFunction
