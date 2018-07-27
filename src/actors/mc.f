\ main character
    require src/actors.f
    
s" data/samurai.png" frames
    0 , 0 , 16 , 16 , 0 , 0 ,
    0 , 16 , 16 , 16 , 0 , 0 ,
2dup 0.05 anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim
2drop

here  0 , 8 , 16 , 8 ,
    actor: *mc  a_walkd  act>  1 udlr ;