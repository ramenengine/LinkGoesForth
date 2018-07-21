    include afkit/ans/section.f
    warning off

\ ---------------------------------------------------------------------------------------------------------
[section] preamble
empty
    include src/engine.f
    
\ stuff and things
\   ability to pause gameplay during status screen
\   character
\   game data
\   save data



\ ---------------------------------------------------------------------------------------------------------
[section] hud


:is overlay
    0 0 at  displayw 32 black rectf
    \ show hearts
    \ show current item
    \ actually maybe could also draw the status screen here too just offscreen (we scroll up to see it)
;


\ ---------------------------------------------------------------------------------------------------------
[section] test

: north  coords y@ -exit  -1 coords y+!  4 13 * for  -4 bgcam y+!  pause  loop ;
: south  1 coords y+!  4 13 * for  4 bgcam y+!  pause  loop ;
: west   coords x@ -exit  -1 coords x+!  2 20 * for  -8 bgcam x+!  pause  loop ;
: east   1 coords x+!  2 20 * for  8 bgcam x+!  pause  loop ;

: rld  reinit  s" just src/main.f test" evaluate ;

: preview
    0 perform>
        begin
            <up> kpressed? if  north  then
            <down> kpressed? if  south  then
            <left> kpressed? if  west  then
            <right> kpressed? if  east  then
            <enter> kpressed? if  0 [']  rld later  then
            pause
        again
;

: *thing
    objects one
;

: test
    objects clear
    100 for  *thing  loop
    objects one preview
; test

s" data/world000.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer
    1 tmxlayer tilebuf1 0 0 load-tmxlayer

