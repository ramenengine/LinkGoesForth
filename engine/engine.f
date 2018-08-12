create engine/engine.f  \ fixes require bug

#1 #0 #0 include ramen/cutlet.f

65536 2 * constant #MAXTILES   \ need to define this here not at the top otherwise it'll be decimal

require ramen/tiled/tiled.f
require ramen/lib/buffer2d.f
require engine/lib/kbfocus.f
include engine/variables.f
include engine/loop.f
include engine/util.f
include engine/world.f


: loadgfx
    s" data/bg.png" findfile loadbmp to bgbank
    bgbank tw th 1 maketiles drop
;


: init
    loadgfx
; init

: reinit  -tiles loadgfx ;
