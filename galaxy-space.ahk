#MaxHotkeysPerInterval 9999999999999999999999999999999999999999999999999999
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
loop{
If GetKeyState("f23", "P") {
   Suspend, On
   Gui, Color, c3498C2
   keywait f23
   Suspend, Off
   Gui, Color, c202020
   }
sleep, 50
}

myLabel:
keywait space
send,{shift up}
Gui, Color, c202020
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
	Gui, Color, c3498C2
	return
}
if(y=3){
	send,{shift up}
	y++
	Gui, Color, c202020
	return
}
if(y=4){
	send,{space}
	return
}


RunWait <redacted>
ExitApp

