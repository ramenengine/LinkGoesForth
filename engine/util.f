: clear   each> me remove ;  
: -vel    0 0 vx 2! ;
: left?   <left> kstate ;
: right?  <right> kstate ;
: up?     <up> kstate ;
: down?   <down> kstate ;
: pleft?   <left> pressed ;
: pright?  <right> pressed ;
: pup?     <up> pressed ;
: pdown?   <down> pressed ;

: udlr  ( speed -- )
        -vel
        left? if dup negate vx ! left dir ! then
        right? if dup vx ! right dir ! then
        up? if dup negate vy ! up dir ! then
        down? if dup vy ! down dir ! then
        drop ;
        
: pudlr4 ( -- )  \ detects presses, no diagonals, no velocity stuff
        pleft? if left dir ! exit then
        pright? if right dir ! exit then
        pup? if up dir ! exit then
        pdown? if down dir ! exit then ;

: sudlr4 ( -- )  \ detects state, no diagonals, no velocity stuff
        left? if left dir ! exit then
        right? if right dir ! exit then
        up? if up dir ! exit then
        down? if down dir ! exit then ;

table: walkv     1 , 0 ,   0 , -1 ,   -1 , 0 ,   0 , 1 ,   ;table
