/* PlaySnd */

call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

call RxFuncAdd 'VRLoadFuncs', 'VROBJ', 'VRLoadFuncs'
call VRLoadFuncs

if arg(1) = '' then signal _help
ok = _PlaySoundEvent(arg(1))

exit

_PlaySoundEvent: procedure
    /* This subroutine will play the file 
       associated with a given sound event 
       code */
    EventCode = arg(1)
   
    /* Get the soundfile for the given 
       eventcode */
    SoundFile = _GetSoundEventFile(EventCode)
    
    /* If we got a file let us play it */
    if SoundFile <> '' then do
       rc = SysOpenObject(SoundFile,'DEFAULT',0)
    end
    else say 'No soundfile available for code 'arg(1)
return rc

/*:VRX         _GetSoundEventFile
*/
_GetSoundEventFile: procedure
    /* determine the file that is associated with 
       the given sound event code */
    parse arg EventCode

    /* Get MMPM.INI */
    MMPMINI = _GetMMBase()||"\MMPM.INI"
    
    /* read the sound event entry */
    SoundEventEntry = VRGetIni( "MMPM2_AlarmSounds", EventCode, MMPMINI )
    if SoundEventEntry \= '' then do /* Sound defined? */
        /* parse the filename from the entry */
        Parse Var SoundEventEntry SoundFile '#' .
    end
    else SoundFile = ''
    /* return the soundfilename */
return SoundFile

_GetMMBase: procedure
    MMBASE = strip(value( "MMBASE",, "OS2ENVIRONMENT" ),'T',';')
return MMBASE

_Help:
	say 'You need to specify the sound event code!'
exit
