#Requires AutoHotkey v2.0

; Ctrl+F1 启动一次：在当前活动窗口内从下往上拖动（200px）
^F5::
{
	WinActive()
	MouseClickDrag "L" ,334,878,0,0,500,"R"
	Sleep 50
	MouseClickDrag "L" ,334,878,0,0,500,"R"
	Sleep 50
	MouseClickDrag "L" ,334,878,0,0,500,"R"
	Sleep 50
	MouseClickDrag "L" ,334,878,0,0,500,"R"
	Sleep 50
	return
}


^End::ExitApp
