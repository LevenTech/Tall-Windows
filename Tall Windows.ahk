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
	MsgBox, , Tall Windows by LevenTech, %message%
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