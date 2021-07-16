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
SetTitleMatchMode,2


Gui, -Caption 
Gui, Color, c3498C2
Gui, +ToolWindow
Gui, Font, c3498C2
Gui, Add, text,, K
Gui, +AlwaysOnTop +Owner


FileCreateDir, %A_WorkingDir%\data
OnWinActiveChange(hWinEventHook, vEvent, hWnd)
{
	static _ := DllCall("user32\SetWinEventHook", UInt,0x3, UInt,0x3, Ptr,0, Ptr,RegisterCallback("OnWinActiveChange"), UInt,0, UInt,0, UInt,0, Ptr)
    WinGet, NAM, processname, % "ahk_id " WinExist("A")
    if FileExist( A_WorkingDir "\data\" NAM ".ini"){
    Gui, Show, NoActivate y-22 x880 NA
    global yoe := 1 
    global y = 1
    return
    }
    if !FileExist( A_WorkingDir "\data\" NAM ".ini"){
    Gui, hide 
    global yoe := 0 
    global y = 0
    return
    }
}



loop,256{
	e=% getkeyname(format("vk{:x}",a_index-1))
	if(e!=""&&e!="space"&&e!="win"&&e!="Lwin"&&e!="Rwin"){
		hotkey, % "~*" e, mylabel
	}
}
myLabel:
keywait space
send,{shift up}
y = 1
return


^space::
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



#if yoe = 1

~Lctrl::
~*Lwin::
keywait space
send,{shift up}
y = 1
return



~Lshift::
~Rshift::
~f23::
~Lwin::
suspend, on
return
~Lctrl up::
~Lshift up::
~Rshift up::
~f23 up::
~Lwin up::
suspend, off
return



*space::
if(y=1){
	send,{space}
	 y++
	return
}
if(y=2){
	Send,{shift down}
	y++
	return
}
if(y=3){
	send,{shift up}
	y++
	return
}
if(y=4){
	send,{space}
	return
}
