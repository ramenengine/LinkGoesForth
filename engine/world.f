variable scrshift
: +scrshift  scrshift on   p1 >{ my-keygroup off } ;
: -scrshift  scrshift off  -vel  p1 >{ -vel my-keygroup on } ;
: (shift)    +scrshift  perform>  pauses  -scrshift ;
: shiftfor   cam 's vx 2!  cam >{ (shift) } ;

: ?scrshift  scrshift @ -exit  r> drop ;

: west   ?scrshift  coords x@ -exit  -1 coords x+!  -16 2 20 * / 0 p1 's vx 2!   2 20 *  -8 0  shiftfor ;
: east   ?scrshift                   1 coords x+!   16 2 20 * /  0 p1 's vx 2!   2 20 *  8 0   shiftfor ;
: north  ?scrshift  coords y@ -exit  -1 coords y+!  0  -16 4 13 * / p1 's vx 2!  4 13 *  0 -4  shiftfor ;
: south  ?scrshift                   1 coords y+!   0  16 4 13 * /  p1 's vx 2!  4 13 *  0 4   shiftfor ;

