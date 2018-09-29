require engine/engine.f  \ only load once for persistence
                         \ `empty` beforehand to reload everything
include game.f

create heart$ #1 c, #3 c, 
:is hud
    0 0 at  default-font fnt !
    s" Rupees " print+  gp @ 1i (.) print+
    newline
    s" Arrows " print+  qv @ 1i (.) print+
    newline
    s" Life " print+  hp @ for red heart$ count print+ loop ;
;

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

: plunk  p1 0 0 away ;


\ runtime startup (test version)
:is warm
    overworld
    objects none  *preview
    rolecall
    3 hp !
;

\ every time this file is loaded
loadtilemap
stage starts
include workspace.f
