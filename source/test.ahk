    #NoEnv
I_Icon = %A_ScriptDir%\SVG\icon.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
SetKeyDelay, 0, 50
#SingleInstance force
SetWorkingDir %A_ScriptDir%
#Persistent
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#installKeybdHook
#UseHook On
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 10
SetWinDelay, -1
SetControlDelay, -1
SendMode Input	
DetectHiddenWindows, On
FileCreateDir, %A_WorkingDir%\data
SetTitleMatchMode,2


Gui, -Caption 
Gui, Color, c3498C2
Gui, +ToolWindow
Gui, Font, c3498C2
Gui, Add, text,, K
Gui, +AlwaysOnTop +Owner

OnWinActiveChange(hWinEventHook, vEvent, hWnd)
{
	static _ := DllCall("user32\SetWinEventHook", UInt,0x3, UInt,0x3, Ptr,0, Ptr,RegisterCallback("OnWinActiveChange"), UInt,0, UInt,0, UInt,0, Ptr)
    WinGet, NAM, processname, % "ahk_id " WinExist("A")
    if FileExist( A_WorkingDir "\data\" NAM ".ini"){
    Gui, Show, y500 x-22 NA
    return
    }
    if !FileExist( A_WorkingDir "\data\" NAM ".ini"){
    Gui, hide 
    return
    }
}

7::
WinGet, NAM, processname, % "ahk_id " WinExist("A")
if FileExist( A_WorkingDir "\data\" NAM ".ini"){
FileDelete, %A_WorkingDir%\data\%NAM%.ini
OnWinActiveChange(hWinEventHook, vEvent, hWnd)
return
}
if !FileExist( A_WorkingDir "\data\" NAM ".ini"){
FileAppend,, %A_WorkingDir%\data\%NAM%.ini
OnWinActiveChange(hWinEventHook, vEvent, hWnd)
return
}
Return



