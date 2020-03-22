* KHELP.EXE profile:
*
* KHELP.EXE looks for a profile KHELP.PRO in the current directory, then
* in any directory specified in the KHELP setting, then in any directory
* specified in the PATH setting, and finally in its own "home" directory:
* unfortunately it doesn't consider KEDIT MACROPATH, therefore I decided
* to SET KEDIT MACROPATH KHELP with SET KHELP=<old setting> generally in
* AUTOEXEC.BAT (DOS and OS/2) and CONFIG.SYS (OS/2)
*
* SET MOUSE ON|OFF [LEFT|RIGHT]        : default ON RIGHT resp. OFF RIGHT
* SET MOUSE ON     [LEFT|RIGHT]        : erroneous if KHELP finds no mouse
* SET CURSORSHape AUTO                 : default ("undocumented" KHELP SET)
* SET CURSORSHape USER over1 over2 ins1 ins2 [ON|OFF]
* SET MONITOR COLOR|MONO               : default okay unless on COLOR CGA
* SET PRINTER LPT1|LPT2|COM1|COM2      : default LPT1
* SET RETRace ON|OFF|BIOS              : default OFF, only needed for CGA

* SET COLOR field defaults:                 changed:
* ALERT            71 WHITE ON RED                    (error dialog box)
* Arrow            30 YELLOW ON BLUE                  (left of command)
* BORDer           30 YELLOW ON BLUE                  (left edge etc.)
* Cmdline          30 YELLOW ON BLUE                  (final line)
* DELIMITers       30 YELLOW ON BLUE                  (link delimiters)
* DIALog          112 BLACK ON WHITE                  (dialog box)
* GRAYout         115 CYAN ON WHITE                   (unavailable items)
* HIGHlight       112 BLACK ON WHITE                  (focus link)
* MENUBar         112 BLACK ON WHITE                  (first line)
* MENUHighlight   127 BRIGHT WHITE ON WHITE           (accelerators)
* MENUItem          7 WHITE ON BLACK                  (focus line of menu)
* MOUSEBar        112 BLACK ON WHITE                  (above command line)
* SCRollbar        27 BRIGHT CYAN ON BLUE             (right edge)
* SLIder           27 BRIGHT CYAN ON BLUE             (slider on scroll bar)
* TEXTarea         27 BRIGHT CYAN ON BLUE             (topic text)
* THIghlight      112 BLACK ON WHITE                  (focus target)
* (unmodifiable)  112 BLACK on WHITE                  (dialog box shadow)
* (changed MENUH)     RED ON WHITE               116  (accelerators)

* LOR ALERT        71
* LOR ARROW        30
* LOR BORDER       30
* LOR CMDLINE      30
* LOR DELIMIT      30
* LOR DIALOG      112
* LOR GRAYOUT     115
* LOR MENUBAR     112
COLOR MENUHIGH    116
* LOR MENUITEM      7
* LOR MOUSEBAR    112
* LOR SCROLLBAR    27
* LOR SLIDER       27
* LOR TEXTAREA     27
* LOR THIGHLIGHT  112
