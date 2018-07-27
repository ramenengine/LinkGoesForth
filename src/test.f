
:is hud
    0 0 at  displayw 32 black rectf
    \ show hearts
    \ show current item
    \ actually maybe could also draw the status screen here too just offscreen (we scroll up to see it)
;

: north  coords y@ -exit  -1 coords y+!  4 13 * for  -4 bgcam y+!  pause  loop ;
: south  1 coords y+!  4 13 * for  4 bgcam y+!  pause  loop ;
: west   coords x@ -exit  -1 coords x+!  2 20 * for  -8 bgcam x+!  pause  loop ;
: east   1 coords x+!  2 20 * for  8 bgcam x+!  pause  loop ;

: rld  reinit  s" include src/test.f" evaluate ;

: preview
    0 perform>
        begin
            ctrl? if
                <up> pressed if  north  then
                <down> pressed if  south  then
                <left> pressed if  west  then
                <right> pressed if  east  then
                <enter> pressed if  0 [']  rld later  then
            then 
            pause
        again
;

\ : *thing
\     objects one
\ ;
\ : test
\     objects clear
\     100 for  *thing  loop
\     objects one preview
\ ; test

create tileprops  hex
00 c,
0f c, 00 c, $1f c, $1f c, 20 c, 00 c, 00 c, 00 c,     00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
0f c, 00 c, 00 c, 00 c, 0f c, 00 c, 00 c, 00 c,     00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
00 c, 00 c, 00 c, 00 c, 0f c, 00 c, 00 c, 00 c,     00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,    00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,
fixed

:is tileprops@  1i tileprops + c@ ;

s" data/world000.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer

include src/actors/mc.f

objects clear    
objects one preview
150 150 at  objects *mc  ME VALUE MC  2 priority !