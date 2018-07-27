\ main character
    
s" data/samurai.png" frames
    ( 00 ) 0 , 0 , 16 , 16 , 0 , 0 ,  \ down
    ( 01 ) 0 , 16 , 16 , 16 , 0 , 0 ,
    ( 02 ) 16 , 0 , 16 , 16 , 0 , 0 ,  \ right
    ( 03 ) 16 , 16 , 16 , 16 , 0 , 0 ,
    ( 04 ) 32 , 0 , 16 , 16 , 0 , 0 ,  \ up
2dup 0.1 anim: a_walku   4 , 0 , 0 ,   4 h, 0 , 0 ,  ;anim
2dup 0.1 anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim
2dup 0.1 anim: a_walkl   2 h, 0 , 0 ,   3 h, 0 , 0 ,  ;anim
2dup 0.1 anim: a_walkr   2 , 0 , 0 ,   3 , 0 , 0 ,  ;anim
2drop

var olddir

: ?walk
    dir @ olddir @ = ?exit
    dir @ olddir ! 
    dir @ case
        up of    a_walku endof
        down of  a_walkd endof
        left of  a_walkl endof
        right of a_walkr endof
    endcase ;

here  0 , 8 , 16 , 8 ,  \ map hitbox
    actor: *mc  act>  1 udlr-  ?walk ;