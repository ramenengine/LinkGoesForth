
\ Z-sorted game objects

require ramen/lib/rsort

var zdepth
var priority
variable p

: #queued  ( addr -- addr cells )  here over - cell/ 1p ;
: zdepth@  's zdepth @ ;
: zsort  ['] zdepth@ rsort ;
: drawem  ( addr cells -- )  cells bounds do  i @ as  draw  cell +loop ;
: enqueue  ( objlist -- )  each>   hidden @ ?exit  priority @ p @ <> ?exit  me , ;
: drawobjects  ( objlist priority -- )
    p !
    { >r  here dup  r> enqueue  #queued  2dup zsort  drawem  reclaim } ;
