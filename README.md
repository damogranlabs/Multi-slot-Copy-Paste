# Multi-slot Copy Paste
Source: [Damogran Labs: https://damogranlabs.com/](https://damogranlabs.com/2018/10/multi-slot-copy-paste/)  
Date: 21.10.2018  
Version: 1.0  

## About
This project enable you to use copy/paste feature on up to 9 separate slots.  
Based as script on [AHK for Windows](https://autohotkey.com/), but standalone executable can be found on [Damogran Labs SourceForge.](https://sourceforge.net/projects/multi-slot-copy-paste/)

## How to use
* Set slot content (copy) with **Left Ctrl + Alt + Numpad 1-9**.
* Recall (paste) with **Right Ctrl + Alt + Numpad 1-9**. 
* It does not interfere with standard Windows **Ctrl + c** and **Ctrl + v**.
* Press **Right Ctrl + Alt + Numpad 0**, and you can inspect all slots content in popup window.
  
![Multi-slot Copy Paste slots data](https://i1.wp.com/damogranlabs.com/wp-content/uploads/2018/10/multislot_content.png)
  
## Can I customize it?
Yes, of course. Edit 'multislotCopyPaste.ahk' according to [AHK docs](https://autohotkey.com/docs/AutoHotkey.htm).  
If you simply wish to change keyboard shortcut mapping, you need to modify lines starting with:  
*<^!Numpad1::*  
In this case, '<^'stands for left control, '!' for Alt and NumpadX is self-explanatory. As long as you stick to AHK syntax and don't interfere with other windows/program shortcuts, you are fine. Remember to restart AHK script ofter saving.


[![Multi-slot Copy Paste in action](https://damogranlabs.com/wp-content/uploads/2018/10/multislotCopyPasteGitHubPreview.png)](https://youtu.be/_i9paz8CwKg)

