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
Suspend, On


Gui, -Caption 
Gui, Color, c202020
Gui, +ToolWindow
Gui, Font, c3498C2
Gui, Add, text,, K
Gui, +AlwaysOnTop +Owner
Gui, Show, y500 x-22 NA

loop,256{
	e=% GetKeyName(Format("vk{:x}",A_Index-1))
	if(e!=""&&e!="Space"&&e!="LAlt"&&e!= "Alt"&&e!= "Win"&&e!= "LWin"&&e!= "RWin"){
		Hotkey, % "~*" e, myLabel
	}
}



#if yoe = 1
~Rctrl::
~Lwin::
~Lalt::
~Lctrl::
Suspend, On
Gui, Color, c202020
return

~Rctrl up::
~Lwin up::
~Lalt up::
~Lctrl up::
Suspend, Off
Gui, Color, c3498C2
return
#if

::fg fg::
Suspend, Off
Gui, Color, c3498C2
yoe := 1 
return


up::
Suspend, On
Gui, Color, c202020
yoe := 0 
return

myLabel:
keywait space
send,{shift up}
y = 1
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
