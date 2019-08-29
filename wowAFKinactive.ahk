#SingleInstance Force
#NoEnv
#Persistent
#InstallKeybdHook
#InstallMouseHook

;;SetKeyDelay, 50, 10
SendMode Input
SetTitleMatchMode, 2

WinGet, swbpid, PID, World of Warcraft
Winget, swbid, ID, World of Warcraft
WinGetClass, swbclass, World of Warcraft
;;msgbox, class is %swbclass% pid is %swbpid% and Id is %swbid% ,, just for informations and testing

SAPI := ComObjCreate("SAPI.SpVoice")
SAPI.volume := 50

say(msg) { ;Text to speech using integrated COM
	global SAPI
	SAPI.speak(msg,1)
}

ONE_FRAME_IN_MS = 8.33
Wait(frames)
{
  Global
  Letimer := frames * ONE_FRAME_IN_MS
  Sleep, %Letimer%
}

autoAFK=false

^+MButton::
	if(autoAFK == "false") {
		autoAFK = true
		say("Auto A F K enabled")
	} else {
		autoAFK = false
		say("Auto A F K disabled")
	}	
return

~*$Space::
	if(autoAFK=="true"){
		Loop {	
			ifWinExist, ahk_id %swbid%
  			{
				if(autoAFK=="true"){
    					ControlSend, ahk_parent, {A down}, ahk_pid %swbpid%
					Wait(10)
					ControlSend, ahk_parent, {A up}, ahk_pid %swbpid%
    					Wait(500)
				}
				else {
					Break
				}
  			}
			else {
				Break
			}
			ifWinExist, ahk_id %swbid%
  			{
				if(autoAFK=="true"){
    					ControlSend, ahk_parent, {D down}, ahk_pid %swbpid%
					Wait(10)
					ControlSend, ahk_parent, {D up}, ahk_pid %swbpid%
    					Wait(500)
				}
				else {
					Break
				}
  			}
			else {
				Break
			}
			
			ifWinExist, ahk_id %swbid%
  			{
				if(autoAFK=="true"){
    					ControlSend, ahk_parent, {Space down}, ahk_pid %swbpid%
					Wait(10)
					ControlSend, ahk_parent, {Space up}, ahk_pid %swbpid%
    					Wait(500)
				}
				else {
					Break
				}
  			}
			else {
				Break
			}
		
		}
	}	
return

