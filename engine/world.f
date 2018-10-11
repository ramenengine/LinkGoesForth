depend engine/lib/tools.f

\ Scrolling
variable scrshift
: +scrshift  scrshift on   p1 >{ my-keygroup off } ;
: -scrshift  scrshift off  -vel  p1 >{ -vel my-keygroup on } ;
: (shift)    +scrshift  perform>  pauses  -scrshift ;
: shiftfor   cam 's vx 2!  cam >{ (shift) } ;
: ?scrshift  scrshift @ -exit  r> drop ;
: vel!  's vx 2! ;
: west   ?scrshift  -1 coords x+!  -16 2 20 * / 0 p1 vel!   2 20 *  -8 0 shiftfor ;
: east   ?scrshift  1 coords x+!   16 2 20 * /  0 p1 vel!   2 20 *  8 0  shiftfor ;
: north  ?scrshift  -1 coords y+!  0  -16 4 13 * / p1 vel!  4 13 *  0 -4 shiftfor ;
: south  ?scrshift  1 coords y+!   0  16 4 13 * /  p1 vel!  4 13 *  0 4  shiftfor ;

vtbl godir  ' west , ' east , ' north , ' south , 

\ Warping
: warp  ( row col )
    swap  2dup coords 2!  320 208 2*  cam 's x 2!
    cam 's x 2@ 152 96 2+ p1 's x 2! ;

