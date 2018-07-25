0 value bgbank
0 value tinter

\ tile size
16 constant tw
16 constant th

\ tile buffers
tilebuf constant tilebuf0
1024 1024 buffer2d: tilebuf1

struct layer
    layer 0 svar bg.scrollx
    layer 0 svar bg.scrolly

objlist stage
    stage 256 pool: objects

\ the layers are orphan objects.  (layer objects describe the layers, they are not containers.)
objlist layers
    layers object: spr0 
    layers object: bg0  
    layers object: spr1 
    layers object: bg1  
    layers object: spr2 

\ add object priority.  can be 0, 1, or 2.
var priority

\ extend objects: transform info (used by layers too)
var sx  var sy  var ang
color sizeof field tint

\ extend objects: bg layer stuff
var scrollx
var scrolly
var tbi       \ tile base index

\ extending the renderer; draw stuff either under or over the game
defer background  :is background ;
defer hud         :is hud ;

\ window rectangle
create window 0 , 32 , displayw , displayh 32 - ,

\ screen coordinates
create coords  0 , 0 ,

\ background camera
create bgcam 0 , 0 , 
