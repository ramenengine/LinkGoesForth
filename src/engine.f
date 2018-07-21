    #2 #0 #0 include ramen/brick.f

    65536 2 * constant #MAXTILES   \ need to define this here not at the top otherwise it'll be decimal

    require ramen/tiled/tiled.f
    require ramen/lib/buffer2d.f
    require src/kbfocus.f
    require src/drawobjects.f

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
        stage 256 pool: objects

    \ the layers are orphan objects
    objlist layers
        layers object: spr0 
        layers object: bg0  
        layers object: spr1 
        layers object: bg1  
        layers object: spr2 

    \ add object priority.  can be 0, 1, or 2.
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
    
    \ background camera
    create bgcam 0 , 0 , 

    
\ ---------------------------------------------------------------------------------------------------------
[section] init

\ load sprite data
\ s" sprites.dat" file-exists [if]
\     s" sprites.dat" sprites /sprites @file
\ [then]
\ s" sprites.f" file-exists [if]
\     s" sprites.f" included
\ [then]

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

\ ---------------------------------------------------------------------------------------------------------
[section] layers

: transformed ;

: drawsprlayer  ( list -- )
    en @ 0= if  2drop  exit then
    transformed  drawobjects ;

: windowmap  ( array2d -- )
    window 4@ clip>
        window 2@ +at
        scrollx 2@ tw th scroll
            third loc  swap pitch@  tilemap ;

: drawbglayer
    en @ 0= if drop exit then
    bgcam 2@ scrollx 2!
    transformed windowmap
;

: layers
    {
        spr0 as objects 0 drawsprlayer
        bg0 as tilebuf0   drawbglayer
        spr1 as objects 1 drawsprlayer
        bg1 as tilebuf1   drawbglayer
        spr2 as objects 2 drawsprlayer
    }
;

\ ---------------------------------------------------------------------------------------------------------
[section] go

: think  stage each> act ;
: physics  stage each> vx x v+  y @ zdepth ! ;
: /step  step> think stage multi ;
: overworld show> black backdrop background layers overlay ;
: go /step overworld ; go

\ ---------------------------------------------------------------------------------------------------------
[section] helpers

: clear  each> me remove ;  

