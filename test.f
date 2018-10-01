
require engine/engine.f  \ only load once for persistence
                         \ `empty` beforehand to reload everything
include game.f

create sym 0 c,
: symbol+  1i sym c!  sym #1 print+ ;

:is hud
    0 0 at  msdos fnt !
    s" Rupees " print+  gp @ 1i (.) print+
    newline
    s" Arrows " print+  qv @ 1i (.) print+
    newline
    s" Life " print+  hp @ for red 3 symbol+ loop ;
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

: *preview  actors one act> previewkeys ;

create tileprops  s" data/tileprops.dat" file,
:is tileprops@  >gid 1i tileprops + c@ ;

: plunk  p1 0 0 away ;

\ runtime startup (test version)
:is cold ;
:is warm
    overworld
    actors none  *preview
    rolecall
    3 hp !
;

\ every time this file is loaded
loadtilemap
stage starts

[defined] ui [if] include workspace.f [then]
