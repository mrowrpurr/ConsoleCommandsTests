scriptName ConsoleCommandsTest extends SkyUnitTest hidden
{Base script for Lilac tests for Console Commands

Clears all command data before every test runs.}

function BeforeEach()
    ConsoleCommands.Clear()
endFunction

Form function GetModForm(int formID) global
    return Game.GetFormFromFile(formID, "ConsoleCommandTests.esp")
endFunction

ExampleCommand function GetExampleCommand() global
    return GetModForm(0x808) as ExampleCommand
endFunction

HelloCommand function GetHelloCommand() global
    return GetModForm(0x806) as HelloCommand
endFunction

FooCommand function GetFooCommand() global
    return GetModForm(0x807) as FooCommand
endFunction

BarCommand function GetBarCommand() global
    return GetModForm(0x807) as BarCommand
endFunction