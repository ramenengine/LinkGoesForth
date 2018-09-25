\ main character
    
require engine/lib/avatara.f

s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 8 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 8 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 8 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 8 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 8 ,  \ up
2dup walk_anim_speed anim: a_walku   4 , 4 h, ;anim  
2dup walk_anim_speed anim: a_walkd   0 , 1 , ;anim   
2dup walk_anim_speed anim: a_walkl   2 h, 3 h, ;anim 
2dup walk_anim_speed anim: a_walkr   2 , 3 , ;anim   
2drop

defrole mc
    table: mc-walkanims
        ' a_walkr , ' a_walku , ' a_walkl , ' a_walkd ,
    ;table
    mc-walkanims mc 's walkanims !
    1.5 mc 's spd !
    mc actordata:  0 , 0 , 16 , 8 ,  \ map hitbox

mc :to start  avatara -> start ;
mc :to idle   avatara -> idle ;
mc :to walk   avatara -> walk ;

mc actor: /mc
: *mc  objects one /mc ;
mc :recipe *mc ;