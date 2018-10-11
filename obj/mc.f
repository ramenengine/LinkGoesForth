\ main character
    
depend engine/lib/avatara.f
depend obj/item.f

s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 8 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 8 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 8 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 8 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 8 ,  \ up
0.15
3dup anim: a_walku   4 , 4 h, ;anim  
3dup anim: a_walkd   0 , 1 , ;anim   
3dup anim: a_walkl   2 h, 3 h, ;anim 
3dup anim: a_walkr   2 , 3 , ;anim   
3drop

actor: mc 16 , 8 ,  \ map hitbox
table: mc-walkanims
    ' a_walkr , ' a_walku , ' a_walkl , ' a_walkd ,
;table
mc-walkanims mc 's walkanims !
1.5 mc 's spd !

: ?pickup  ( role -- flag )  role @ =  dup if me remove then ;

: c/objs
    with actors each>  hit? -exit  
        rupee ?pickup if 1 gp +! then
        heart ?pickup if 1 hp +! then
        arrow ?pickup if 1 qv +! then
;

mc :to start  avatara -> start  act> c/objs ;
mc :to idle   avatara -> idle ;
mc :to walk   avatara -> walk ;

: *mc  mc *actor ;
: *p1  *mc me to p1 ;
mc :recipe *p1 ;