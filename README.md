# KEXX
*KEDIT macro collection*

This is a copy of [purl.net/xyzzy/kex][2011] as it was or should have been in November 2011, i.e., the last known good local `inetput/ftproot/kex` folder content with ***.kex*** (KEXX), ***.kml*** (KEDIT Macro Library), one ***.cmd*** (NT shell), two ***rex*** ([Rexx](https://github.com/frank-e/rexx-fan "rexx-fan")), and three ***.zip*** (archive) files.  

The archived [xedit][KEXX] page explains the content, for many one-line descriptions see the header of [khelp][2020].

## Version 0.3 ##
Meanwhile some seriously obsolete cruft incl. OS/2 Kedit 5.0 workarounds for the `DOS` + `DOSN` + `DOSQ` commands in a `dos.kml` Kedit Macro Library, the `rexx.kex` + `rexxtrap.kex` condition handler support for Quercus + REXXSAA PC DOS 7 + OS/2 explained in [REXXTRAP][2006] (2006), and the hilarious 8+3 workaround for KeditW 1.0 with a `vi.kex` + `vi.cmd` are removed from [khelp][2020] and archived in  [kexx2010][2010]. 

The old wannabe-portability `rexxtrap` procedures might be still interesting, or rather, intimidating:  I'm confident that the new [rex][2019] portability + condition handling for ooRexx + Regina won't work if `stderr` is NOTREADY or closed or doesn't exist (GUI or detached), or if there is no free file handle for the `sourceline()` BIF. If you love ooRexx `RxMessageBox` in these situations check out the old code in [rexxtrap.cmd][2008] (2008) with twenty "portable" (excl. EBCDIC, KEXX, and Regina among others) Rexx snippets. 

[2006]: http://purl.net/xyzzy/rexxtrap.htm (purl.net/xyzzy/rexxtrap.htm)
[2008]: http://purl.net/xyzzy/src/rexxtrap.cmd (purl.net/xyzzy/src/rexxtrap.cmd)
[2010]: https://github.com/frank-e/KEXX/blob/master/kexx2010.zip (kexx2010.zip)
[2011]: https://purl.net/xyzzy/kex/
[KEXX]: https://purl.net/xyzzy/xedit.htm (KEXX Macros)
[2019]: https://github.com/frank-e/KEXX/blob/master/rex.kex (rex.kex)
[2020]: https://github.com/frank-e/KEXX/blob/master/khelp.rex (khelp.kex)
