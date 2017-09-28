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
	Menu, Tray, Icon, Tall` Windows.ico, 1, 0
	 
	Menu, Tray, NoStandard
	Menu, Tray, Add, Instructions, MyHelp
	Menu, Tray, Default, Instructions 
	Menu, Tray, Standard

; SCREEN PIXEL CONFIGURATION
;----------------------------
	Left := -10
	FullWidth := 1100

	Top := 0
	TopHalfHeight := 940

	Middle := 930
	BottomHalfHeight := 940
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


NumPad0::
	TrayTip "0" Pressed, "0" Pressed. Turn off NumLock to Maximize Windows, , 16
Return

NumPad2::
	TrayTip "2" Pressed, "2" Pressed. Turn off NumLock to use Bottom Half, , 16
Return

NumPad8::
	TrayTip "8" Pressed, "8" Pressed. Turn off NumLock to use Top Half, , 16
Return


; MAXIMIZE
NumPadIns::
	WinGetTitle, Title, A
	WinMaximize, %Title%
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