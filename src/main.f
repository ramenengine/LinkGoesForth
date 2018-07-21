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

: north  coords y@ -exit  -1 coords y+!  4 13 * for  -4 bg0 's scrolly +!  pause  loop ;
: south  1 coords y+!  4 13 * for  4 bg0 's scrolly +!  pause  loop ;
: west   coords x@ -exit  -1 coords x+!  2 20 * for  -8 bg0 's scrollx +!  pause  loop ;
: east   1 coords x+!  2 20 * for  8 bg0 's scrollx +!  pause  loop ;

: rld  reinit  s" just src/main.f test" evaluate ;

: clear  objects1 each> me remove ;  clear
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
    objects1 one
;
: test
    100 for  *thing  loop
    objects1 one preview
; test

s" data/world000.tmx" open-tilemap
    0 tmxlayer tilebuf0 0 0 load-tmxlayer


