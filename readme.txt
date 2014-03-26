ClipBoardMonitor (and Editor) version 2.1.1
===========================================

A. What is this?

This widget shows one icon as long there is text in the clipboard and 
shows a different (empty) icon as soon as there is any other datatype 
or no data at all in the clipboard.

If text is stored in the clipboard (widget is "full"), the tooltip shows 
the content of the clipboard and a doubleclick opens a simple window in 
which the content of the clipboard can be edited or discarded.

If the widget shows no text, OS/2's standard clipboard viewer is opened.

NEW: There is a MMOS/2 sound event associated with a clipboard change.

B. Prerequisites:

- XWPS 0.9.19 or better
- Cristiano Guadanigno's Rexx Scroller Widget
- VROBJ.DLL (VX-REXX runtime dll) found on the Warp 4 CD-ROM
   
C. Installation:

1. Install the Rexx Scroller widget, if you have not already.
2. Run "Install.CMD" from the directory you unpacked this package.
3. Move the ClipEdit20 to your desktop. Make sure you did not loose the
   extended attributes.
4. CTRL-drag it to your xCenter.
5. You are done.

D. Useful little program

This widget makes use of a little program called PlaySnd.CMD.
It does not more than play an OS/2 (eCS) system sound by providing
the sound code as a parameter on the commandline.

Well known sound codes are:

  0 -  12 used by standard OS/2 sound events
555 - 561 used by xWorkplace 0.9.14 or better
590       used by xCenter: MozillaMail 1.0  widget
591       used by xCenter: Clipboard change	widget
666 - 668 used by HBHealthMon 0.7.4
680       used by HBHealthMon 0.7.4
681 - 684 used by RexxAutoStart 1.8 or better
690 - 694 used by BSCU and BinSuk/PM 1.2.0
700       used by KDBE 0.6.12 or better
997       used by Testing

PlaySnd.CMD can be found in the XWPS\bin directory.

E. VX-REXX and xCenter widgets

This widget demonstrates, how most features of VX-REXX can be used in 
REXX button, REXX gauge or REXX scroller widget code without calling 
a whole executable. Unfortunately it is not possible to use VX-REXX 
controls on the widget.

The underlying VX-REXX project as source is also included.

Speaking technically: The DoubleClick action code is basically the output
of VX-REXX "create macro" function, with a modification to load the window 
file (ClipEdit.VRW) from somewhere in your path. This is necessary because
the gauge widget otherwise searches for a file named RexxDoubleClk (or so)
in the root of the boot drive...

The output of the VX-REXX "create macro" function is stripped down to the
absolutely necessary functionality without sacrificing compatibility.

Known problems:
- This might not work on Object REXX (not tested)
- No icon for the systemmenu (does not work if done the usual ways)

F: Authors and history:

Version 1.0 was done by me, whereas Cristiano Guadanigno ported it from
the REXX gauge widget to his much smarter Rexx scroller widget. After that
I stripped down everything unnecessary, added the usual init routine, which
is found in (almost) all of my widgets plus the code for the new sound event.
Now the widget is neat und much smaller than it was before.

The next release will be even smaller, because I am currently testing a new 
way to store widget code.

Herwig Bauernfeind 
EMail: herwig.bauernfeind@aon.at
