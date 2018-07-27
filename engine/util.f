: clear   each> me remove ;  
: -vel    0 0 vx 2! ;
: left?   <left> kstate <pad_4> kstate or ;
: right?  <right> kstate <pad_6> kstate or ;
: up?     <up> kstate <pad_8> kstate or ;
: down?   <down> kstate <pad_2> kstate or ;
: udlr  ( speed -- )
        -vel
        left? if dup negate vx ! left dir ! then
        right? if dup vx ! right dir ! then
        up? if dup negate vy ! up dir ! then
        down? if dup vy ! down dir ! then
        drop ;
: udlr2 ( speed -- )  \ no diagonal motion
        -vel
        left? if negate vx ! left dir ! exit then
        right? if vx ! right dir ! exit then
        up? if negate vy ! up dir ! exit then
        down? if vy ! down dir ! exit then
        drop ;
: greeny  draw>  16 16 green rectf ;
