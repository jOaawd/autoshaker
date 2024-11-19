;autoexecute

#Persistent
SetTitleMatchMode, 2

spamToggle := false
keyBind := ""

MsgBox, Please press a key to set as the keybind.
Input, keyBind, L1 M ; Wait for a single key press from the user

if (keyBind = "")
{
    MsgBox, No key was pressed. Exiting script.
    ExitApp
}

MsgBox, You have set %keyBind% as the keybind. Press it to toggle auto shake

; Dynamically create the hotkey for the keybind
Hotkey, %keyBind%, ToggleSpam
return

ToggleSpam:
    ; Toggle state for spamming
    spamToggle := !spamToggle

    ; If spamming starts, press \ once and then start spamming "S" and "Enter"
    if (spamToggle)
    {
        Send, \  ; Press \ once at the start
        SetTimer, SpamPress, 20  ; Start spamming every 20 ms
    }
    else
    {
        SetTimer, SpamPress, Off  ; Stop spamming
    }
return

SpamPress:
    Send, s
    Send, {Enter}
return

GuiClose:
ExitApp
;autoexecute

