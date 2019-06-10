; This is a multi-slot copy/paste script for Windows.
;
; How-to:
; To store something in a specific slot, press: LEFT Control + LEFT WINDOWS + Numpad 1-9
; To recall something from a specific slot, press: LEFT Control  + LEFT ALT + Numpad 1-9
; To restore last clipboard data, press: LEFT Control  + LEFT ALT + Backspace
; To show all slots in a special GUI window, press: LEFT Control + LEFT ALT + Numpad 0 
;
; You can still use usual Ctrl + c / Ctrl + v as you used to (for, text, files, images, ...).
; Other slots are intended for text only.
;
; Source: https://damogranlabs.com
; Date: 16.11.2018
; Version: 1.2

#SingleInstance Force
#include displayGui.ahk

slotData := Object()

; COPY keys
<^<#Numpad1::
    getSelectedText(1)
    return

<^<#Numpad2::
    getSelectedText(2)
    return

<^<#Numpad3::
    getSelectedText(3)
    return

<^<#Numpad4::
    getSelectedText(4)
    return

<^<#Numpad5::
    getSelectedText(5)
    return

<^<#Numpad6::
    getSelectedText(6)
    return

<^<#Numpad7::
    getSelectedText(7)
    return

<^<#Numpad8::
    getSelectedText(8)
    return

<^<#Numpad9::
    getSelectedText(9)
    return

; PASTE
<^<!Numpad1::
    pasteSelectedSlot(1)
    return

<^<!Numpad2::
    pasteSelectedSlot(2)
    return

<^<!Numpad3::
    pasteSelectedSlot(3)
    return

<^<!Numpad4::
    pasteSelectedSlot(4)
    return

<^<!Numpad5::
    pasteSelectedSlot(5)
    return

<^<!Numpad6::
    pasteSelectedSlot(6)
    return

<^<!Numpad7::
    pasteSelectedSlot(7)
    return

<^<!Numpad8::
    pasteSelectedSlot(8)
    return

<^<!Numpad9::
    pasteSelectedSlot(9)
    return

; Store/restore clipboard content
$^c:: ; store clipboard before new clipboard is saved
    storeClipboard()
    return

<^<!BackSpace:: ; write old cached clipboard data to current clipboard
    restoreClipboard()
    return

<^<!Numpad0:: ; Show slots data in popup message window
    printAllSlotsData()
    return



; --------------------------------------------------------------------------------------------------------
; Functions
; --------------------------------------------------------------------------------------------------------
getSelectedText(slotIndex)
{   ; store current clipboard data, copy currently selected text, restore clipboard data
    global slotData

    currentClipboardData := ClipboardAll ; save clipboard contents
    
    Clipboard := ; clear clipboard
    Send ^c    ; copy clipboard
    ClipWait 1  ; wait for clipboard to contain data
    slotData[slotIndex] := Clipboard ; get currently selected text
    
    Clipboard := currentClipboardData ; restore original Clipboard contents
    currentClipboardData := ; save the memory if the clipboard was very large
}

pasteSelectedSlot(slotIndex)
{   ; fast-print slot data: copy currently clipboard data, set clipboard data with slot data, paste, restore original clipboard data
    global slotData

    currentClipboardData := ClipboardAll ; save clipboard content

    Clipboard := slotData[slotIndex] ; set clipboard
    Send ^v    ; paste clipboard
    Sleep 100

    Clipboard := currentClipboardData ; restore original Clipboard content
    currentClipboardData = ; save the memory if the clipboard was very large
}

storeClipboard()
{   ; store clipboard data and issue 'copy' command
    global slotData

    slotData[10] := Clipboard

    Send ^c    ; copy clipboard
    ClipWait 1  ; wait for clipboard to contain data
}

restoreClipboard()
{   ; write cached clipboard data back to clipboard
    global slotData

    Clipboard := slotData[10]
    ClipWait 1
}

beautifySlotName(slotName, addLeadingNewLines:=True)
{   ; common function to add dashes and center text - used to separate slot name and slot data
    totalLengthOfSlotName := 100
    _numberOfSpaces := 2
    lenOfSlotName := StrLen(slotName)

    numberOfDashes := (totalLengthOfSlotName - lenOfSlotName - _numberOfSpaces)/2
    loop % numberOfDashes
        dashesString .= "-"
    
    newSlotName := dashesString . " " . slotName . " " . dashesString . "`n" ; spaces number must match with _numberOfSpaces
    if (addLeadingNewLines){
        newSlotName := "`n`n" . newSlotName
    }
    return newSlotName
}

printAllSlotsData()
{   ; display non-empty slots data in ScrollBox Gui
    global slotData

    lastClipboard := beautifySlotName("Last clipboard", False) . slotData[10]
    printData := lastClipboard
    
    ; print out only slots that are not empty
    if (slotData[1]) {
        printData .= beautifySlotName("Slot 1") . slotData[1]
    }
    if (slotData[2]) {
        printData .= beautifySlotName("Slot 2") . slotData[2]
    }
    if (slotData[3]) {    
        printData .= beautifySlotName("Slot 3") . slotData[3]
    }
    if (slotData[4]) {
        printData .= beautifySlotName("Slot 4") . slotData[4]
    }
    if (slotData[5]) {
        printData .= beautifySlotName("Slot 5") . slotData[5]
    }
    if (slotData[6]) {
        printData .= beautifySlotName("Slot 6") . slotData[6]
    }
    if (slotData[7]) {
        printData .= beautifySlotName("Slot 7") . slotData[7]
    }
    if (slotData[8]) {
        printData .= beautifySlotName("Slot 8") . slotData[8]
    }
    if (slotData[9]) {
        printData .= beautifySlotName("Slot 9") . slotData[9]
    }

    ScrollBox(printData, "s f{s10} h600 w500", "Multi-Slot Copy Paste: non-empty slots")
}
