require engine/engine.f  \ only load once for persistence
                         \ `empty` beforehand to reload everything
include game.f

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

: *preview  objects one act> previewkeys ;

create tileprops  s" data/tileprops.dat" file,
:is tileprops@  >gid 1i tileprops + c@ ;

: plunk  p1 0 -8 away ;

: rolecall  s" Objects" find-objgroup load-objects ;

\ runtime startup (test version)
:is warm
    objects none  *p1  *preview
    rolecall
;

\ every time this file is loaded
reinit
include workspace.f
