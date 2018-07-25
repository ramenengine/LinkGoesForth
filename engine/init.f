\ load sprite data
\ s" sprites.dat" file-exists [if]
\     s" sprites.dat" sprites /sprites @file
\ [then]
\ s" sprites.f" file-exists [if]
\     s" sprites.f" included
\ [then]

: loadgfx
    s" data/bg.png" findfile loadbmp to bgbank
    bgbank tw th 1 maketiles drop
;


: init
    loadgfx
    \ 1024 for 1024 for  $10 rnd i j .s tilebuf0 loc !  loop loop
    \ nativewh *bmp to tinter
; init

: reinit  -tiles loadgfx ;
