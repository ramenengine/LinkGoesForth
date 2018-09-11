\ main character
    
require engine/lib/avatara.f

s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 8 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 8 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 8 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 8 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 8 ,  \ up
2dup walk_anim_speed anim: a_walku   4 , 0 , 0 ,   4 h, 0 , 0 ,  ;anim  
2dup walk_anim_speed anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim   
2dup walk_anim_speed anim: a_walkl   2 h, 0 , 0 ,  3 h, 0 , 0 ,  ;anim 
2dup walk_anim_speed anim: a_walkr   2 , 0 , 0 ,   3 , 0 , 0 ,  ;anim   
2drop

roledef: mc
    table: (walkanms)  ' a_walkr , ' a_walku , ' a_walkl , ' a_walkd ,  ;table
    (walkanms) mc 's walkanms !
    1.5 mc 's spd !
    mc actordata:  0 , 0 , 16 , 8 ,  \ map hitbox
mc :to start  avatara -> start ;
mc :to idle   avatara -> idle ;
mc :to walk   avatara -> walk ;

mc actor: *mc