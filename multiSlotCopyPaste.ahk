; This is a multi-slot copy/paste script for Windows.
;
; How-to:
; To store something in a specific slot, press: LEFT Control + Alt + Numpad 1-9
; To recall something from a specific slot, press: RIGHT Control + Alt + Numpad 1-9
; To printout all slots in a special notification message box, press: RIGHT Control + Alt + Numpad 0 
;
; You can still use usual Ctrl+c / Ctrl+v as you used to.
;
; Source: https://damogranlabs.com
; Date: 21.10.2018
; Version: 1.0

#SingleInstance Force

; COPY: Left Control + Alt + Numpad1-9
<^!Numpad1::
    slot1 := getSelectedText()
    return

<^!Numpad2::
    slot2 := getSelectedText()
    return

<^!Numpad3::
    slot3 := getSelectedText()
    return

<^!Numpad4::
    slot4 := getSelectedText()
    return

<^!Numpad5::
    slot5 := getSelectedText()
    return

<^!Numpad6::
    slot6 := getSelectedText()
    return

<^!Numpad7::
    slot7 := getSelectedText()
    return

<^!Numpad8::
    slot8 := getSelectedText()
    return

<^!Numpad9::
    slot9 := getSelectedText()
    return

; PASTE: Right Control + Alt + Numpad1-9
>^!Numpad1::
    Send % slot1
    return

>^!Numpad2::
    Send % slot2
    return

>^!Numpad3::
    Send % slot3
    return

>^!Numpad4::
    Send % slot4
    return

>^!Numpad5::
    Send % slot5
    return

>^!Numpad6::
    Send % slot6
    return

>^!Numpad7::
    Send % slot7
    return

>^!Numpad8::
    Send % slot8
    return

>^!Numpad9::
    Send % slot9
    return

; Show slots data in popup message window
>^!Numpad0::
    s1 := % "--------------------------- Slot 1: ---------------------------`n" . slot1 
    s2 := % "`n`n--------------------------- Slot 2: ---------------------------`n" . slot2
    s3 := % "`n`n--------------------------- Slot 3: ---------------------------`n" . slot3
    s4 := % "`n`n--------------------------- Slot 4: ---------------------------`n" . slot4
    s5 := % "`n`n--------------------------- Slot 5: ---------------------------`n" . slot5 
    s6 := % "`n`n--------------------------- Slot 6: ---------------------------`n" . slot6 
    s7 := % "`n`n--------------------------- Slot 7: ---------------------------`n" . slot7 
    s8 := % "`n`n--------------------------- Slot 8: ---------------------------`n" . slot8
    s9 := % "`n`n--------------------------- Slot 9: ---------------------------`n" . slot9
    slots := s1 . s2 . s3 . s4 . s5 . s6 . s7 . s8 . s9
    
    MsgBox % slots
    return

; ------------------------------------------------------------------------------------------------------
; store current clipboard data, copy currently selected text, restore clipboard data
getSelectedText()
{
    currentClipboardData := ClipboardAll ; save clipboard contents
    
    ClipBoard := ; clear clipboard
    Send, ^c    ; copy clipboard
    ClipWait,1  ; wait for clipboard to contain data
    selectedText := Clipboard ; get currently selected text
    
    ClipBoard := currentClipboardData ; restore original Clipboard contents
    currentClipboardData := ; save the memory if the clipboard was very large

    return selectedText
}