\ main character
    
require engine/lib/avatara.f
require obj/item.f

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
    mc actordata:  16 , 8 ,  \ map hitbox

: c/objs
    with objects each>  hit? -exit  
        role @ item = -exit
            kind@ rupee = if 1 gp +! then
            kind@ heart = if 1 hp +! then
            kind@ arrow = if 1 qv +! then
            me remove ;

mc :to start  avatara -> start  act> c/objs ;
mc :to idle   avatara -> idle ;
mc :to walk   avatara -> walk ;

: *mc  mc *actor ;
: *p1  *mc me to p1 ;
mc :recipe *p1 ;