scriptName ConsoleCommandsTest extends Lilac hidden
{Base script for Lilac tests for Console Commands

Clears all command data before every test runs.}

function beforeEach()
    ConsoleCommands.Clear()
endFunction