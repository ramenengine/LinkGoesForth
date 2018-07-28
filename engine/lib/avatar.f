0.15 constant walk_anim_speed
var olddir
rolevar walkanms
rolevar spd
 
actor derive: avatar
    1.5 spd !  
;roledef

: dirkeys?  left? right? up? down? or or or ;
: ?face
    dir @ olddir @ <> if
        dir @ olddir !
        walkanms @ -exit
        walkanms @ dir @ [] @ execute
    then 
;
: !walkv   walkv dir @ 2 * [] 2@  spd @ dup 2*  vx 2! ;
: ?walk    dirkeys? -exit  !walkv  ?face  walk ;

: ?turnstop
    dirkeys? 0= if  idle exit then
    <left> released  <right> released or  <up> released or  <down> released or if
        sudlr4  ?walk
    else
        pudlr4  ?walk
    then ;

avatar :to walk  walk_anim_speed anmspd !  act>  ?turnstop ;
avatar :to idle  -vel  ?face  0 anmspd !  act>  pudlr4  ?walk ;
