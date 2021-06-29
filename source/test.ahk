SetBatchLines,-1

loop {

	Input,key,L1V,{LCtrl}{RCtrl}{RShift}{LShift}{RAlt}{LAlt}{Enter}{Tab}{Space}

	If (ErrorLevel=Max){
        msgbox, hayeeee
		SendInput {%key% up}
    }
	else if InStr(ErrorLevel,"EndKey:")

		SendInput % "{" SubStr(ErrorLevel,9) "}"

}
