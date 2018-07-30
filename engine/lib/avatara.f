\ aligned version

0.15 constant walk_anim_speed
var olddir
rolevar walkanms
rolevar spd
 
actor derive: avatar
    1.5 spd !  
    8 spd @ / constant walk_snap
;roledef

action idle
action walk

: dirkeys?  left? right? or up? or down? or ;
: ?face
    dir @ olddir @ <> if
        dir @ olddir !
        walkanms @ -exit
        walkanms @ dir @ [] @ execute
    then 
;
: !walkv   walkv dir @ 2 * [] 2@  spd @ dup 2*  vx 2! ;
: ?walk    dirkeys? -exit  walk ;

: ?turnstop  dirkeys? 0= if  idle pause  exit then  ?face !walkv ;
: ?udlr4  <left> released  <right> released or  <up> released or  <down> released or 
        if  sudlr4  else  pudlr4  then ;
        
: 1pace  walk_snap 0 do  pause  ?udlr4  loop
    vx @ if x @ 1 + [ 7 invert ]# and x ! then
    vy @ if y @ 1 + [ 7 invert ]# and y ! then ;

avatar :to walk  walk_anim_speed anmspd !  !walkv  ?face  0 perform>  begin  1pace  ?turnstop  again ;
avatar :to idle  -vel  ?face  0 anmspd !  0 perform> begin  pudlr4  ?walk  pause again ;
