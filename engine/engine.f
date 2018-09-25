require ramen/ramen.f
#1 #5 #0 [ramen] [checkver]
require ramen/cutlet.f

65536 2 * constant #MAXTILES   \ need to define this here not at the top otherwise it'll be decimal

require ramen/lib/tiled.f
require ramen/lib/buffer2d.f
require engine/lib/kbfocus.f
include engine/variables.f
include engine/loop.f
include engine/util.f
include engine/world.f

: loadmap
    s" data/world.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer
;

: loadgfx
    s" data/bg.png" findfile loadbmp to bgbank
    bgbank tw th 1 maketiles
;

: init
    loadgfx
    loadmap
; 

:is cold  init ;
: reinit  -tiles loadgfx loadmap ;

init