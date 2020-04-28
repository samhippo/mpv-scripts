#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, SubMenu1, Add, Next, MenuHandlerC1
Menu, SubMenu1, Add, Prev, MenuHandlerC2
Menu, MyContextMenu, Add, Play/Pause, MenuHandlerP1
Menu, MyContextMenu, Add, Fullscreen, MenuHandlerP2
Menu, MyContextMenu, Add, Playlist, :SubMenu1
return

MenuHandlerC1:
Send {>}
return
MenuHandlerC2:
Send {<}
return
MenuHandlerP1:
Send {space}
return
MenuHandlerP2:
Send {f}
return

#IfWinActive ahk_class mpv
#If MouseIsOver("ahk_class mpv")
RButton::
	Menu, MyContextMenu, Show
Return
#If

MouseIsOver(WinTitle) {
    MouseGetPos,xpos, ypos, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
