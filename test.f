require engine/engine.f
include actors/mc.f

:is hud
;

: upd  reinit  s" include test.f" evaluate ;

: previewkeys
    scrshift @ ?exit
    ctrl? -exit
        <up> pressed if  north  exit then
        <down> pressed if  south  exit then
        <left> pressed if  west  exit then
        <right> pressed if  east  exit then
        <enter> pressed if  0 [']  rld later  then
;

: preview  act> previewkeys ;

create tileprops  s" data/tileprops.dat" file,
:is tileprops@  >gid 1i tileprops + c@ ;

:is warm
    init
    objects clear    
    objects one preview
    192 128 at  objects *mc  me to p1  1 priority !
    0 0 cam 's x 2!
    0 0 coords 2!
    s" data/world000_1.2.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer
;

