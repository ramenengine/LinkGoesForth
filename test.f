require engine/engine.f  \ only load once for persistence
                         \ `empty` beforehand to reload everything
include obj/mc.f

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
    objects one /mc  me to p1  
    s" data/world.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer
    0 0 warp
;

