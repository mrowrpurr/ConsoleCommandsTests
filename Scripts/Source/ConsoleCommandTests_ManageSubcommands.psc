scriptName ConsoleCommandTests_ManageSubcommands extends ConsoleCommandsTest
{Tests for adding, removing, and editing subcommands}

function Tests()
    Test("can add a subcommand").Fn(AddSubcommandTest()) ; TODO TODO TODO MAKE IT WORK WITHOUT Fn()
    Test("can remove a subcommand").Fn(RemoveSubcommandTest())
    Test("can add multiple subcommands").Fn(AddMultipleSubcommandsTest())
    ; it("can add a subcommand to a subcommand")
    ; it("can add aliases for subcommands")
    ; it("can add a subcommand to a command using command alias")
endFunction

function AddSubcommandTest()
    ConsoleCommands.Add("greetings")
    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(BeEmpty())

    ConsoleCommands.AddSubcommand("greetings", "hello")

    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(HaveLength(1))
    ExpectString(ConsoleCommands.SubcommandNames("greetings")[0]).To(EqualString("hello"))
endFunction

function RemoveSubcommandTest()
    ConsoleCommands.Add("greetings")
    ConsoleCommands.AddSubcommand("greetings", "hello")
    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(HaveLength(1))
    ExpectString(ConsoleCommands.SubcommandNames("greetings")[0]).To(EqualString("hello"))

    ConsoleCommands.RemoveSubcommand("greetings", "hello")

    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(BeEmpty())
endFunction

function AddMultipleSubcommandsTest()
    ConsoleCommands.Add("greetings")
    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(BeEmpty())

    ConsoleCommands.AddSubcommand("greetings", "hello")
    ConsoleCommands.AddSubcommand("greetings", "goodbye")

    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(HaveLength(2))
    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(ContainString("hello"))
    ExpectStringArray(ConsoleCommands.SubcommandNames("greetings")).To(ContainString("goodbye"))
endFunction
