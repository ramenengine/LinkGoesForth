variable scrshift

: +scrshift  scrshift on   default_group -keygroup ;
: -scrshift  scrshift off  -vel  cam -> -vel  default_group +keygroup ;
: (shift)    +scrshift  perform>  pauses  -scrshift ;
: shiftfor   { cam as  vx 2!  (shift) } ;

: ?scrshift  scrshift @ -exit  r> drop ;

: west   ?scrshift  coords x@ -exit  -1 coords x+!  -16 2 20 * / 0 vx 2!   2 20 *  -8 0  shiftfor ;
: east   ?scrshift                   1 coords x+!   16 2 20 * /  0 vx 2!   2 20 *  8 0   shiftfor ;
: north  ?scrshift  coords y@ -exit  -1 coords y+!  0  -16 4 13 * / vx 2!  4 13 *  0 -4  shiftfor ;
: south  ?scrshift                   1 coords y+!   0  16 4 13 * /  vx 2!  4 13 *  0 4   shiftfor ;

