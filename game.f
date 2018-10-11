\ game-specific words that don't belong in the engine
\ common to release and testing

\ gotta reload these every time manually until i write reload-scripts 
include scripts.f

create tileprops  s" data/tileprops.dat" file,
:is tileprops@  >gid 1i tileprops + c@ ;
s" data/Px437_IBM_BIOS.ttf" 8 ALLEGRO_TTF_NO_KERNING font: msdos
s" data/nintendo-nes-font.ttf" 8 ALLEGRO_TTF_NO_KERNING font: nes
create sym 0 c,
: symbol+  1i sym c!  sym #1 print+ ;
:is hud
    0 0 at  msdos fnt !
    vieww 32 black rectf
    white
    s" Rupees " print+  gp @ 1i (.) print+
    newline
    s" Arrows " print+  qv @ 1i (.) print+
    newline
    s" Life " print+  hp @ for red 3 symbol+ loop ;
;
:is cold  loadmap ;
:is warm  overworld  actors none  rolecall ; 
