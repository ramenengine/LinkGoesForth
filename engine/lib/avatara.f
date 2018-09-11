\ player-controlled avatar; aligned version
require engine/lib/actor.f
require engine/lib/tools.f

table: walkv     1 , 0 ,   0 , -1 ,   -1 , 0 ,   0 , 1 ,   ;table
0.15 constant walk_anim_speed
var olddir  rolevar walkanms  rolevar spd  action idle  action walk  
basis >{  1.5 spd !  }
vtbl godir  ' west , ' east , ' north , ' south , 
roledef: avatara
: walk_snap  8 spd @ / ;
: ?face
    dir @ olddir @ = ?exit
    dir @ olddir !  walkanms @ ?dup -exit dir @ [] @ execute ;
: fakeload  -vel  0 anmspd @!  15 pauses  anmspd ! ;
: shiftwait  begin pause scrshift @ 0= until
    x @ 1 + dup 8 mod - x !  y @ 1 + dup 8 mod - y !  idle ;
: scroll  fakeload  godir  shiftwait ;
: ?edge
    dirkeys? -exit
    x @ camx @ -  0 <=  left? and             if  0 scroll  then
    x @ camx @ -  320 mbw @ -  >=  right? and if  1 scroll  then
    y @ camy @ 8 + -  0 <=  up? and           if  2 scroll  then
    y @ camy @ -  208 mbh @ -  >=  down? and  if  3 scroll  then ;
: !walkv   walkv dir @ 2 * [] 2@  spd @ dup 2*  vx 2! ;
: ?walk    dirkeys? -exit  walk ;
: ?turnstop  dirkeys? 0= if  idle  exit then  ?face !walkv ;
: ?udlr4  dirkeysup? if  sudlr4  else  pudlr4  then ;
: nearest  dup >r  2 / + dup  r> mod - ;
: csnap  dup @ 8 nearest swap ! ;
: snap  x csnap y csnap ;
: 1pace  walk_snap for  pause  ?udlr4  loop  snap ;
\ Actions:
avatara :to walk
    walk_anim_speed anmspd !  !walkv  ?face
    0 perform>  begin  ?edge  1pace  ?turnstop  again ;
avatara :to idle
    -vel  ?face  0 anmspd !
    0 perform>  begin  sudlr4  ?walk  pause again ;
avatara :to start  idle ;