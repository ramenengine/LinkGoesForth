warning off
empty
#1    constant initial-display-flags  \ windowed
include engine/engine.f

:is hud
\    0 0 at  displayw 32 black rectf
    \ show hearts
    \ show current item
    \ actually maybe could also draw the status screen here too just offscreen (we scroll up to see it)
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


include actors/mc.f

objects clear    
objects one preview
192 128 at  objects *mc  me to p1  1 priority !

:is warm
    init
    s" data/world000_1.2.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer
;
warm

