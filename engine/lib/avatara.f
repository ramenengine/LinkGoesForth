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
: dirkeysup?  <left> released  <right> released or  <up> released or  <down> released or ;
: ?face
    dir @ olddir @ <> if
        dir @ olddir !
        walkanms @ -exit
        walkanms @ dir @ [] @ execute
    then 
;

: fakeload  -vel  15 pauses ;
: shiftwait  begin pause scrshift @ 0= until  x @ 1 + dup 8 mod - x !  y @ 1 + dup 8 mod - y !  idle ;

: ?edge
    dirkeys? -exit
    x @ cam 's x @ -  0 <=  left? and             if  fakeload  west  shiftwait  then
    x @ cam 's x @ -  320 mbw @ -  >=  right? and if  fakeload  east  shiftwait  then
    y @ cam 's y @ 8 + -  0 <=  up? and           if  fakeload  north shiftwait  then
    y @ cam 's y @ -  208 mbh @ -  >=  down? and  if  fakeload  south shiftwait  then ;

: !walkv   walkv dir @ 2 * [] 2@  spd @ dup 2*  vx 2! ;
: ?walk    dirkeys? -exit  walk ;

: ?turnstop  dirkeys? 0= if  idle  exit then  ?face !walkv ;
: ?udlr4  dirkeysup? if  sudlr4  else  pudlr4  then ;
        
: 1pace  walk_snap 0 do  pause  ?udlr4  loop
    vx @ if x @ 1 + [ 7 invert ]# and x ! then
    vy @ if y @ 1 + [ 7 invert ]# and y ! then ;


avatar :to walk
    walk_anim_speed anmspd !  !walkv  ?face
    0 perform>  begin  ?edge  1pace  ?turnstop  again ;
    
avatar :to idle
    -vel  ?face  0 anmspd !
    0 perform>  begin  sudlr4  ?walk  pause again ;
