/* NT ooREXX helper for Kedit 5 CLIPS.KEX (Frank Ellermann, 2008) */

   signal on  novalue  name TRAP ;  signal on  syntax name TRAP
   signal on  failure  name TRAP ;  signal on  halt   name TRAP
   signal off notready           /* JFTR, ooREXX read size 0 trap */

   TEMP = stream( 'KEDITPUT.TMP', 'c', 'query exists' )
   if TEMP = ''   then  exit TRAP( 'cannot find KEDITPUT.TMP' )

   FULL = 'WSClipboard'
   if RxFuncQuery(   FULL )   then
      if RxFuncAdd(  FULL, 'RxWinSys', FULL )   then
         exit TRAP( 'cannot add RxWinSys' FULL )
   FULL = sign( WSClipboard( 'AVAIL' ))

   if arg( 1 ) = 'PUT'  then do  /* copy KEDITPUT.TMP, empty okay */
      if FULL  then  call WSClipboard 'EMPTY'
      FAIL = WSClipboard( 'COPY', charin( TEMP, 1, chars( TEMP )))
   end
   if arg( 1 ) = 'GET'  then do  /* paste to KEDITPUT.TMP for GET */
      if FULL
         then  FAIL = sign( charout( TEMP, WSClipboard( 'PASTE' )))
         else  FAIL = sign( stream( TEMP, 'c', 'query size' ))
   end                           /* KEDITPUT.TMP has to be empty  */

   return FAIL                   /* undefined FAIL causes a TRAP  */

/* see <URL:http://purl.net/xyzzy/rexxtrap.htm>, (c) F. Ellermann */

TRAP:                            /* select REXX exception handler */
   call trace 'O' ;  trace N           /* don't trace interactive */
   parse source TRAP                   /* source on separate line */
   TRAP = x2c( 0D ) || right( '+++', 10 ) TRAP || x2c( 0D0A )
   TRAP = TRAP || right( '+++', 10 )   /* = standard trace prefix */
   TRAP = TRAP strip( condition( 'c' ) 'trap:' condition( 'd' ))
   select
      when wordpos( condition( 'c' ), 'ERROR FAILURE' ) > 0 then do
         if condition( 'd' ) > ''      /* need an additional line */
            then TRAP = TRAP || x2c( 0D0A ) || right( '+++', 10 )
         TRAP = TRAP '(RC' rc || ')'   /* any system error codes  */
         if condition( 'c' ) = 'FAILURE' then rc = -3
      end
      when wordpos( condition( 'c' ), 'HALT SYNTAX'   ) > 0 then do
         if condition( 'c' ) = 'HALT' then rc = 4
         if condition( 'd' ) > '' & condition( 'd' ) <> rc then do
            if condition( 'd' ) <> errortext( rc ) then do
               TRAP = TRAP || x2c( 0D0A ) || right( '+++', 10 )
               TRAP = TRAP errortext( rc )
            end                        /* future condition( 'd' ) */
         end                           /* may use errortext( rc ) */
         else  TRAP = TRAP errortext( rc )
         rc = -rc                      /* rc < 0: REXX error code */
      end
      when condition( 'c' ) = 'NOVALUE'  then rc = -2 /* dubious  */
      when condition( 'c' ) = 'NOTREADY' then rc = -1 /* dubious  */
      otherwise                        /* force non-zero whole rc */
         if datatype( value( 'RC' ), 'W' ) = 0 then rc = 1
         if rc = 0                             then rc = 1
         if condition() = '' then TRAP = TRAP arg( 1 )
   end                                 /* direct: TRAP( message ) */

   TRAP = TRAP || x2c( 0D0A ) || format( sigl, 6 )
   signal on syntax name TRAP.SIGL     /* throw syntax error 3... */
   if 0 < sigl & sigl <= sourceline()  /* if no handle for source */
      then TRAP = TRAP '*-*' strip( sourceline( sigl ))
      else TRAP = TRAP '+++ (source line unavailable)'
TRAP.SIGL:                             /* ...catch syntax error 3 */
   if abbrev( right( TRAP, 2 + 6 ), x2c( 0D0A )) then do
      TRAP = TRAP '+++ (source line unreadable)'   ;  rc = -rc
   end
   select
      when 0 then do                   /* in pipes STDERR: output */
         parse version TRAP.REXX       /* REXX/Personal: \dev\con */
         if abbrev( TRAP.REXX, 'REXXSAA ' ) |                /**/ ,
            6 <= word( TRAP.REXX, 2 )  then  TRAP.REXX = 'STDERR'
                                       else  TRAP.REXX = '\dev\con'
         signal on syntax name TRAP.FAIL
         call lineout TRAP.REXX , TRAP /* fails if no more handle */
      end
      when 1 then do                   /* OS/2 PM or ooREXX on NT */
         signal on syntax name TRAP.FAIL
         call RxMessageBox translate( TRAP, ' ', x2c( 0D )), /**/ ,
            'Trap' time(),, 'ERROR'
      end
      otherwise   say TRAP ; trace ?L  /* interactive Label trace */
   end

   if condition() = 'SIGNAL' then signal TRAP.EXIT
TRAP.CALL:  return rc                  /* continue after CALL ON  */
TRAP.FAIL:  say TRAP ;  rc = 0 - rc    /* force TRAP error output */
TRAP.EXIT:  exit   rc                  /* exit for any SIGNAL ON  */
