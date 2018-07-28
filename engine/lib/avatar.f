0.15 constant walk_anim_speed

s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 0 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 0 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 0 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 0 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 0 ,  \ up
2dup walk_anim_speed anim: a_walku   4 , 0 , 0 ,   4 h, 0 , 0 ,  ;anim  
2dup walk_anim_speed anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim   
2dup walk_anim_speed anim: a_walkl   2 h, 0 , 0 ,  3 h, 0 , 0 ,  ;anim 
2dup walk_anim_speed anim: a_walkr   2 , 0 , 0 ,   3 , 0 , 0 ,  ;anim   
2drop

table: (walkanms)  ' a_walkr , ' a_walku , ' a_walkl , ' a_walkd ,  ;table
table: walkv     1 , 0 ,   0 , -1 ,   -1 , 0 ,   0 , 1 ,   ;table

rolevar walkanms
rolevar spd

actor derive: avatar
    1.5 spd !  
    (walkanms) walkanms !
;roledef

var olddir

: dirkeys?  left? right? up? down? or or or ;
: ?face
    dir @ olddir @ <> if
        dir @ olddir !
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
