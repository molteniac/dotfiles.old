﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#InstallKeybdHook
#UseHook
SetKeyDelay 0

#Include %A_ScriptDir%\IME.ahk
;#Include %A_ScriptDir%\emacs.ahk

;; -------------------------------------------------- 
;; Target Application
;; -------------------------------------------------- 

is_proj()
{
  IfWinActive,ahk_exe WINPROJ.EXE
    Return 1
  Return 0
}

is_intellij()
{
  IfWinActive,ahk_exe idea.exe
    Return 1
  IfWinActive,ahk_exe idea64.exe
    Return 1
  Return 0
}

is_MCalc()
{
  IfWinActive,ahk_exe MCalc.exe
    Return 1
  Return 0
}

is_rlogin()
{
  IfWinActive,ahk_exe RLogin.exe
    Return 1
  Return 0
}

is_vbox()
{
  IfWinActive,ahk_exe VirtualBox.exe
    Return 1
  Return 0
}

is_putty()
{
  IfWinActive,ahk_class PuTTY
    Return 1
  Return 0
}

is_te()
{
  IfWinActive,ahk_class TablacusExplorer
    Return 1
  Return 0
}

is_slack()
{
  IfWinActive,ahk_exe slack.exe
    Return 1
  Return 0
}

is_explorer()
{
  IfWinActive,ahk_exe explorer.exe
    Return 1
  Return 0
}

is_altTabTuner()
{
  IfWinActive,ahk_exe AltTabTuner8.exe
    Return 1
  Return 0
}

is_bandZip()
{
  IfWinActive,ahk_class BandizipClass
    Return 1
  Return 0
}

allowed_quit()
{
  If is_opera()
    Return 1
  If is_te()
    Return 1
  If is_xf()
    Return 1
  If is_browser()
    Return 1
  If is_proj()
    Return 1
  If is_office()
    Return 1
  If is_srcTree()
    Return 1
  If is_winPos()
    Return 1
  Return 0
}

is_winPos()
{
  IfWinActive,ahk_class ThunderRT6FormDC
    Return 1
  Return 0
}

is_srcTree()
{
  IfWinActive,ahk_exe SourceTree.exe
    Return 1
  Return 0
}

is_browser()
{
  If is_vivaldi()
    Return 1
  If is_chrome()
    Return 1
  If is_ie()
    Return 1
  If is_ff()
    Return 1
  Return 0
}

is_tabs()
{
  If is_acrobat()
    Return 1
  If is_te()
    Return 1
  If is_xf()
    Return 1
  If is_browser()
    Return 1
  Return 0
}

is_acrobat()
{
  IfWinActive,ahk_exe AcroRd32.exe
    Return 1
  Return 0
}

is_vivaldi()
{
  IfWinActive,ahk_exe vivaldi.exe
    Return 1
  Return 0
}

is_opera()
{
  IfWinActive,ahk_exe opera.exe
    Return 1
  Return 0
}

is_chrome()
{
  IfWinActive,ahk_exe chrome.exe
    Return 1
  Return 0
}

is_ff()
{
  IfWinActive,ahk_class MozillaWindowClass
    Return 1
  Return 0
}

is_ie()
{
  IfWinActive,ahk_class IEFrame
    Return 1
  Return 0
}

is_eclipse()
{
  IfWinActive,ahk_class #32770
    Return 1
  IfWinActive,ahk_class SWT_Window0
    Return 1
  Return 0
}

is_vim()
{
  IfWinActive,ahk_class Vim
    Return 1
  IfWinActive,ahk_class GVim
    Return 1
  Return 0
}

is_visio()
{
  IfWinActive,ahk_class VISIOA
    Return 1
  Return 0
}

is_excel()
{
  IfWinActive,ahk_class XLMAIN
    Return 1
  Return 0
}

is_word()
{
  IfWinActive,ahk_class OpusApp
    Return 1
  Return 0
}

is_powerpoint()
{
  IfWinActive,ahk_class PPTFrameClass
    Return 1
  Return 0
}

is_office()
{
  If is_powerpoint()
    Return 1
  If is_excel()
    Return 1
  If is_word()
    Return 1
  If is_visio()
    Return 1
  Return 0
}

is_console()
{
  IfWinActive,ahk_class ConsoleWindowClass
    Return 1
  Return 0
}

is_giraffe()
{
  IfWinActive,ahk_class GiraffeMainWindow
    Return 1
  Return 0
}

is_xf()
{
  IfWinActive,ahk_class TXFinder.UnicodeClass
    Return 1
  Return 0
}

is_key_hook()
{
  If is_giraffe()
    Return 1
  If is_eclipse()
    Return 1
  Return 0
}

alt_arrow()
{
  If is_vivaldi()
    Return 1
  If is_opera()
    Return 1
  If is_te()
    Return 1
  If is_xf()
    Return 1
  If is_browser()
    Return 1
  Return 0
}

is_NPEnable()
{
  If is_MCalc()
    Return 1
  If is_slack()
    Return 1
  If is_te()
    Return 1
  If is_xf()
    Return 1
  If is_proj()
    Return 1
  If is_word()
    Return 1
  IfWinActive,ahk_class TTeraPadMainForm
    Return 1
  IfWinActive,ahk_class Notepad
    Return 1
  Return 0
}

;; -------------------------------------------------- 
;; Global Settings
;; -------------------------------------------------- 

ResetImeAndOpenTab()
{
  Send ^t
  Sleep 200
  IME_SET(0)
  Return
}

ResetImeAndSearch()
{
  Send !l
  Sleep 200
  IME_SET(0)
  Return
}

ResetIme()
{
  IME_SET(0)
  Send {ESC}
}

;;
;; ESC
;;
^[::
;;  If (is_intellij() || is_rlogin() || is_vivaldi())
  If (is_intellij() || is_rlogin())
    ResetIme()
  Else
    Send {ESC}
  Return

;;
;; Switching Backspace / Backslash
;;
\::Send {Blind}{Backspace}
Backspace::Send {Blind}\
+\::Send {Blind}+{Backspace}
+Backspace::Send {Blind}|
^\::Send {Blind}{DEL}

;;
;; Switching Right Win / Compose (for Sun type 7)
;;
Rwin::Appskey
Appskey::RCtrl

;;
;; Select All
;;
<#a::Send ^a

;;
;; Alt + TAB
;;
<!j::AltTab
<!k::ShiftAltTab

;;;
;;; Window Move
;;;
;WinMoveStep(XD,YD) {
;  WinGet,win_id,ID,A
;  WinGetPos,x,y,,,ahk_id %win_id%
;  Step :=15
;  x := x + (XD * Step)
;  y := y + (YD * Step)
;  WinMove,ahk_id %win_id%,,%x%,%y%
;  return
;}
;^+y::
;  If !is_intellij()
;    WinMoveStep(-4,0)
;  Else
;    Send %A_ThisHotkey%
;  Return
;^+o::
;  If !is_intellij()
;    WinMoveStep(4,0)
;  Else
;    Send %A_ThisHotkey%
;  Return
;^+i::
;  If !is_intellij()
;    WinMoveStep(0,-2)
;  Else
;    Send %A_ThisHotkey%
;  Return
;^+u::
;  If !is_intellij()
;    WinMoveStep(0,2)
;  Else
;    Send %A_ThisHotkey%
;  Return

;;
;; Window Minimize
;;
#m::WinMinimize,A

;;
;; Window Maximize
;;
#w::
WinGet,Now,MinMax,A
If(Now)
  WinRestore,A
Else
  WinMaximize,A
Return

;;
;; Select Task Tray
;;
#n::Send #b

;;
;; emulate hjkl
;;
^+vk39sc00A::Send {Home} ; 0
^+4::Send {End}
^+h::Send {Left}
^+j::Send {Down}
^+k::Send {Up}
^+l::Send {Right}
^+<#vk39sc00A::Send +{Home}
^+<#4::Send +{End}
^+<#h::Send +{Left}
^+<#j::Send +{Down}
^+<#k::Send +{Up}
^+<#l::Send +{Right}
^+vkBCsc033::Send {PgUp}
^+.::Send {PgDn}
^+<#vkBCsc033::Send +{PgUp}
^+<#.::Send +{PgDn}

;;
;; Developer Tools for Chrome
;;
<#<!i::Send {F12}

;; Shortcuts 
;<!i::Send |
;<!q::Send \
;<!e::Send `=
;<!p::Send {+}
;<!g::Send ``

;; Zoom In/Out
<+<!vkBBsc027::Send ^{WheelUp}
<+<!vkE2sc073::Send ^{WheelDown}

;;
;; emulate Ctrl + TAB function
;;
+!]::
  If is_opera()
    Send ^{PgDn}
  If (is_tabs() || is_browser())
    Send ^{TAB}
  Else If (is_vim() || is_putty() || is_rlogin() || is_intellij())
    Send {ESC}gt
  Else If is_excel()
    Send ^{PgDn}
  Else If is_proj()
    Send !{Right}
  Else
    Send %A_ThisHotkey%
  Return

+![::
  If is_opera()
    Send ^{PgUp}
  If (is_tabs() || is_browser())
    Send +^{TAB}
  Else If (is_vim() || is_putty() || is_rlogin() || is_intellij())
    Send {ESC}gT
  Else If is_excel()
    Send ^{PgUp}
  Else If is_proj()
    Send !{Left}
  Else
    Send %A_ThisHotkey%
  Return

;;
;; emulate LAlt + Arrow for XFinder and Browser
;;
<![::
  If alt_arrow()
    Send !{Left}
  Return
<!]::
  If alt_arrow()
    Send !{Right}
  Return

;;
;; emulate hjkl /w RAlt
;;
;>!j::
;  If is_key_hook()
;    Send {Down}
;  Return
;
;>!k::
;  If is_key_hook()
;    Send {Up}
;  Return
;
;>!h::
;  If is_key_hook()
;    Send {Left}
;  Return
;
;>!l::
;  If is_key_hook()
;    Send {Right}
;  Return

>!j::Send {Down}
>!k::Send {Up}
>!h::Send {Left}
>!l::Send {Right}
>!;::Send {BS}
>!'::Send {Enter}

;; -------------------------------------------------- 
;; Indivudual Settings
;; -------------------------------------------------- 

;; -------------------------------------------------- 
;; Slack
;; -------------------------------------------------- 

#IF WinActive("ahk_exe slack.exe")
<!1::Send ^1
<!2::Send ^2
<!3::Send ^3
<!4::Send ^4
#IF

#IF is_intellij()
!F4::Return
#IF

;------------------------

<^<+m::Send {Appskey}

;------------------------

!v::
  If (is_vim() || is_putty() || is_vbox())
    ;; Paste
    Send +{Insert}
  Else If is_console()
    Send !{Space}ep
  Else
    Send %A_ThisHotkey%
  Return

#IF (is_explorer() || is_te())
<!l::Send !d
<!d::Return
#IF

#IF is_vivaldi()
<!l::ResetImeAndSearch()
<^t::ResetImeAndOpenTab()
#IF

#IF (is_ie() || is_chrome())
<!l::Send ^l
#IF

;------------------------

^q::
  If allowed_quit()
    Send !{F4}
  Else
    Send %A_ThisHotkey%
  Return

<+<!r::
  If (is_te() || is_proj())
    Send {F2}
  Else If is_excel()
    Send !har
  Else
    Send %A_ThisHotkey%
  Return

<+<!l::
  If is_proj()
    Send ^{F2}
  Else If is_excel()
    Send !hal
  Else
    Send %A_ThisHotkey%
  Return

<+<!c::
  If is_excel()
    Send !hac
  Else
    Send %A_ThisHotkey%
  Return


;; -------------------------------------------------- 
;; Excel - Disable F1 key
;; -------------------------------------------------- 

#IfWinActive ahk_exe EXCEL.EXE
F1::
return
#IfWinActive

<+<!w::
  If is_excel()
    Send !hw
  Else
    Send %A_ThisHotkey%
  Return

<+<!t::
  If is_excel()
    Send !hat
  Else
    Send %A_ThisHotkey%
  Return

<+<!b::
  If is_excel()
    Send !hab
  Else
    Send %A_ThisHotkey%
  Return

<+<!m::
  If is_excel()
    Send !ham
  Else
    Send %A_ThisHotkey%
  Return

^d::
  If (is_excel() || is_rlogin())
    Send %A_ThisHotkey%
  Else
    Send {Del}
  Return

^h::Send {BS}
;  If (is_excel() || is_console() || is_eclipse() || is_intellij() || is_acrobat())
;    Send {BS}
;  Else If is_target()
;    Send %A_ThisHotkey%
;  Else
;    Send {BS}
;  Return


;; -------------------------------------------------- 
;; TabTuner.ahk -- Giraffe/Data に直接配置する
;; -------------------------------------------------- 
; IfWinNotExist,ahk_exe AltTabTuner8.exe
; {
;   Run,"C:\usr\AltTabTuner8\AltTabTuner8.exe"
;   WinWait,ahk_exe AltTabTuner8.exe
;   ControlClick, Apply, ahk_exe AltTabTuner8.exe
;   WinClose,ahk_exe AltTabTuner8.exe
; }

;; -------------------------------------------------- 
;; Slack.ahk -- Giraffe/Data に配置 && VbWinPos の設定ファイル指定
;; -------------------------------------------------- 
; #SingleInstance Force ; 複数起動の禁止
; IfWinNotExist,ahk_exe slack.exe
; {
;   Run,"C:\Users\USER0082\AppData\Local\slack\app-1.2.7\slack.exe"
;   WinWait,ahk_exe slack.exe
;   Run,"C:\usr\VbWinPos\VbWinPos.exe" /S /D "C:\usr\VbWinPos\WinPos_Slack.csv"
; }

