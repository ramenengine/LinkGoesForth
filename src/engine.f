    #2 #0 #0 include ramen/brick.f
    65536 2 * constant #MAXTILES
    require ramen/tiled/tiled.f
    require ramen/lib/array2d.f

\ ---------------------------------------------------------------------------------------------------------
[section] variables

    0 value bgbank
    0 value sprbank
    0 value tinter

    \ tile size
    16 constant tw
    16 constant th
    
    \ tile buffers
    tilebuf constant tilebuf0
    1024 1024 buffer2d: tilebuf1

    struct layer
        layer 0 svar bg.scrollx
        layer 0 svar bg.scrolly

    objlist stage
        stage 256 pool: objects0
        stage 256 pool: objects1
        stage 256 pool: objects2

    \ the layers are orphan objects
    create spr0 object  en on
    create bg0 object   en on
    create spr1 object  en on
    create bg1 object   en on
    create spr2 object  en on

    \ add object priority:
        var priority

    \ extend objects: transform info (used by layers too)
        var sx  var sy  var ang
        color sizeof field tint

    \ extend objects: bg layer stuff
        var scrollx
        var scrolly
        var tbi       \ tile base index

    \ extending the renderer; draw stuff either under or over the game
    defer background  :is background ;
    defer overlay     :is overlay ;

    \ window rectangle
    create window 0 , 32 , displayw , displayh 32 - ,

    \ screen coordinates
    create coords  0 , 0 ,
    
\ ---------------------------------------------------------------------------------------------------------
[section] init

\ load sprite data
s" sprites.dat" file-exists [if]
    s" sprites.dat" sprites /sprites @file
[then]
s" sprites.f" file-exists [if]
    s" sprites.f" included
[then]

: loadgfx
    s" data/bg.png" findfile loadbmp to bgbank
    s" data/spr.png" findfile loadbmp to sprbank
    bgbank tw th 1 maketiles >r
    sprbank tw th r> maketiles drop
;
: init
    loadgfx
    1024 for 1024 for  $10 rnd i j tilebuf0 loc !  loop loop
    nativewh *bmp to tinter
; init

: reinit  -tiles loadgfx ;

[section] layers
: transformed ;

: drawsprlayer  ( list -- )
    en @ 0= if drop exit then
    transformed  drawzsorted ;

: windowmap  ( array2d -- )
    window 4@ clip>
        window 2@ +at
        scrollx 2@ tw th scroll
            third loc  swap pitch@  tilemap ;
: drawbglayer
    en @ 0= if drop exit then
    transformed windowmap
;
: layers
    {
    objects0 spr0 as drawsprlayer
    tilebuf0 bg0 as drawbglayer
    objects1 spr1 as drawsprlayer
    tilebuf1 bg1 as drawbglayer
    objects2 spr2 as drawsprlayer
    }
;

\ ---------------------------------------------------------------------------------------------------------
[section] go
: think  stage each> act ;
: physics  stage each> vx x v+  y @ zdepth ! ;
: /step  step> think stage multi ;
: overworld show> black backdrop background layers overlay ;
: go /step overworld ; go
