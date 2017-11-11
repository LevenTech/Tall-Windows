#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;-----------------------------------|
;                                   |
; Tall Windows by LevenTech    |
;                                   |
; Version 1.0 (9-28-17)             |
;                                   |
;-----------------------------------|


; TRAY ICON CONFIGURATION
;-------------------------
	Menu, Tray, Tip,Tall Windows by LevenTech
	Menu, Tray, Icon, %A_ScriptDir%\Icons\Tall` Windows.ico, 1, 0
	 
	Menu, Tray, NoStandard

	Menu, Tray, Add, Instructions, MyHelp
	Menu, Tray, Default, Instructions 
	Menu, Tray, Add, Edit Script, EditScript
	Menu, Tray, Add
	
	
; SCREEN PIXEL CONFIGURATION
;----------------------------
	Left := -10
	FullWidth := 1100

	Top := 0
	TopHalfHeight := 940

	Middle := 930
	BottomHalfHeight := 940

#Include %A_ScriptDir%\..\SeeThroughOrNot\
#Include SeeThroughOrNot_addon.ahk
	
Return
;--------------------------------------------------------------------------
;-----------------     END OF INITIAL RUN       ---------------------------
;--------------------------------------------------------------------------


EditScript: 
	Run, notepad++.exe "%A_ScriptDir%\Tall` Windows.ahk"
Return



; HELP TEXT
;-----------
MyHelp: 
	message = 
	message = %message%`n Ctrl/Win + NumPadUp:`tTop Half
	message = %message%`n Ctrl/Win + NumPadDown:`tBottom Half
	message = %message%`n
	message = %message%`n Ctrl/Win + NumPad5:`tSwitch (for quick fill)

	MsgBox, , Tall Windows by LevenTech, %message%
Return



#IfWinActive ahk_class WorkerW
; Next Desktop Background
;---------------------------------
NumPadDel::
	Send, {AppsKey}
	Sleep 100
	Send, n
Return

NumPadDot::
	if (GetKeyState("NumLock", "T"))
	{
		MsgBox, 4, ,NumLock is ON. Turn it OFF and RETRY?, 3
		IfMsgBox, No
			Return
		IfMsgBox, Timeout
			Return
		SetNumLockState , Off
		Send, #d
		Sleep 100
		Send, {AppsKey}
		Sleep 100
		Send, n
	}
Return

#IfWinActive


NumPadDiv::
	if (GetKeyState("NumLock", "T"))
	{
		Send, /
		TrayTip "/" Pressed, Turn off NumLock to Maximize Windows, , 16
	} else
	{
		WinGetTitle, Title, A
		WinGetPos, X, Y, Width, Height, %Title%
		if (Width>900 AND Height>1500)
		{
			WinRestore, %Title%
		} else
		{
			WinMaximize, %Title%
		}
	}
Return

^NumPad2::
#NumPad2::
	TrayTip "2" Pressed, Turn off NumLock to use Bottom Half, , 16
Return

NumPad5::
	Send, 5
	TrayTip "5" Pressed, Turn off NumLock for Task View, , 16
Return

#NumPad8::
^NumPad8::
	Send, 8
	TrayTip "8" Pressed, Turn off NumLock to use Top Half, , 16
Return


^NumPadUp::
#NumPadUp::
    WinGetTitle, windowName, A
    WinRestore, %windowName%
    WinMove, %windowName%, , -10, 0, FullWidth, TopHalfHeight
Return

^NumPadClear:: !ESC
#NumPadClear:: !ESC

^NumPadDown::
#NumPadDown::
    WinGetTitle, windowName, A
    WinRestore, %windowName%
    WinMove, %windowName%, , -10, Middle, FullWidth, BottomHalfHeight
Return