\ main character
    require src/actors.f
    \ require lib/walk4.f
    
s" data/samurai.png" image: g

create rt
    0 , 0 , 16 , 16 , 0 , 0 ,
    0 , 16 , 16 , 16 , 0 , 0 ,

g 0.05 rt anim: a_walkd   0 , 0 , 0 ,   1 , 0 , 0 ,  ;anim


\ : *mc  one  walk4 ;

: left?   <left> kstate <pad_4> kstate or ;
: right?  <right> kstate <pad_6> kstate or ;
: up?     <up> kstate <pad_8> kstate or ;
: down?   <down> kstate <pad_2> kstate or ;

: greeny  draw>  16 16 green rectf ;

: *mc  one  a_walkd
    0 8  16 8 mbx 4!  
    act>    
        0 0 vx 2!
        left? if -1 vx ! then
        right? if 1 vx ! then
        up? if -1 vy ! then
        down? if 1 vy ! then
   ;