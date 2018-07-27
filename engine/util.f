: clear  each> me remove ;  
: -vel  0 0 vx 2! ;
: frames  image  here ;
: left?   <left> kstate <pad_4> kstate or ;
: right?  <right> kstate <pad_6> kstate or ;
: up?     <up> kstate <pad_8> kstate or ;
: down?   <down> kstate <pad_2> kstate or ;
: udlr  ( speed -- )  -vel
        left? if dup negate vx ! then
        right? if dup vx ! then
        up? if dup negate vy ! then
        down? if dup vy ! then
        drop ;
: greeny  draw>  16 16 green rectf ;
1 constant up
2 constant right
3 constant down
4 constant left