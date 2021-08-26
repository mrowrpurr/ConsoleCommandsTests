scriptName ConsoleCommandTests_ListenForCommands extends Quest ; Lilac
{Tests for listening for executed commands}

; bool _fooEventCalled
; bool _barEventCalled

; function beforeAll()
;     RegisterForModEvent("MyModEventForCommandFoo", "OnCommandFooEvent")
;     RegisterForModEvent("MyModEventForCommandBar", "OnCommandBarEvent")
; endFunction

; function beforeEach()
;     _fooEventCalled = true
;     _barEventCalled = true
; endFunction

; function OnCommandFooEvent(string eventName, string strArg, float fltArg, Form sender)
; endFunction

; function OnCommandBarEvent(string eventName, string strArg, float fltArg, Form sender)
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; ~
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; function TestSuite()
;     describe("Using SKSE mod events", SkseModEventTests())
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Using SKSE Mod Events
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; function SkseModEventTests()
;     it("should send SKSE mod events when command event name is provided", CommandSkseModEventTest())
;     ; it("can unregister sending SKSE mod events for command", CommandUnregisterSkseModEventTest())
; endFunction

; function CommandSkseModEventTest()
;     ConsoleCommands.Add("foo", event = "MyModEventForCommandFoo")
;     expectBool(_fooEventCalled, to, beEqualTo, false)

;     ; Oh jeez, need to be able to call it first!

;     expectBool(_fooEventCalled, to, beEqualTo, true)
; endFunction

; ; function CommandUnregisterSkseModEventTest()

; ; endFunction
