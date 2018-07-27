\ main character
    
0.15 constant walk_anim_speed

s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 0 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 0 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 0 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 0 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 0 ,  \ up
2dup walk_anim_speed anim: a_walku   4 , 0 , 0 ,   4 h, 0 , 0 ,  ;anim  
2dup walk_anim_speed anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim   
2dup walk_anim_speed anim: a_walkl   2 h, 0 , 0 ,   3 h, 0 , 0 ,  ;anim 
2dup walk_anim_speed anim: a_walkr   2 , 0 , 0 ,   3 , 0 , 0 ,  ;anim   
2drop

table: walkanms  ' a_walkr , ' a_walku , ' a_walkl , ' a_walkd ,  ;table

var olddir
: ?anmspd  left? right? up? down? or or or ?exit    0 anmspd ! ;
: ?walkanm
    dir @ olddir @ = if
        walk_anim_speed anmspd !
        exit     
    then
    dir @ olddir !
    walkanms dir @ [] @ execute ;

here  0 , 8 , 16 , 8 ,  \ map hitbox
    actor: *mc  act>  1.5 udlr2  ?walkanm  ?anmspd ;