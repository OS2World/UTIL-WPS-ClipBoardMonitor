/* Install ClipEdit SoundEvent */

say 'Installing files and sound event for xCenter ClipEdit widget'
say '==============================================================='
say
/* This routine is loosely based on Ulrich M”ller's sound001.cmd */

/* Get base of MMOS2 */
MMINI  =strip(value( "MMBASE",, "OS2ENVIRONMENT" ),'T',';')'\MMPM.INI'
XWPPath=strip(SysIni('USER','XWorkplace','XFolderPath'),'T','0'x)
SndPATH=XWPPath'\wav\'
BinPATH=XWPPath'\bin\'
IcoPATH=XWPPath'\icons\'

/* this is the title of the soundevent to be created */
ClipEditMailSound = "xCenter: Clipboard change"
ClipEditSoundFile = "1CLICKA.WAV"

say 'Copying "PlaySnd.CMD" to 'BinPath
'@xcopy PlaySnd.CMD 'BinPath'* >NUL'
say 'Copying "'ClipEditSoundFile'" to 'SndPath
'@xcopy 'ClipEditSoundFile' 'SndPath' >NUL'
say 'Copying icons to 'IcoPath
'@xcopy Clip*bmp 'IcoPath'* >NUL'

/* Create sound entry */
rc = SysINI(MMINI, "MMPM2_AlarmSounds", "591", SndPath||ClipEditSoundFile"#"||ClipEditMailSound||"#70");

/* open WP_SOUND */
say
say 'Now switch to the desktop in order to check the new sound event!'
ok = SysSetObjectData("<WP_SOUND>","OPEN=DEFAULT")

say
say 'Do not forget to put'
say ' - VROBJ.DLL'
say 'into a directory within your LIBPATH!'
