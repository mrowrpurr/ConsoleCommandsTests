scriptName ConsoleCommandTests_ManageCommands extends Lilac
{Tests for adding, removing, and editing commands}

function TestSuites()
    describe("Adding commands", AddingCommandTests())
    describe("Removing commands", RemovingCommandTests())
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Resetting / Clearing all Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TODO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adding Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function AddingCommandTests()
    it("can add a command", AddSimpleCommand())
endFunction

function AddSimpleCommand()
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)

    ConsoleCommands.Add("mycommand")

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 1)
    string firstCommandName = ConsoleCommands.Names()[0]
    expectString(firstCommandName, to, beEqualTo, "mycommand")
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Removing Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function RemovingCommandTests()
    it("can remove a command", RemoveSimpleCommand())
endFunction

function RemoveSimpleCommand()
    ConsoleCommands.Add("mycommand")
    expectInt(ConsoleCommands.Count(), to, beEqualTo, 1)

    ConsoleCommands.Remove("mycommand")

    expectInt(ConsoleCommands.Count(), to, beEqualTo, 0)
endFunction