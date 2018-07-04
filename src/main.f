    include afkit/ans/section.f
    warning off

[section] preamble
empty
    #1 #1 #0 include ramen/brick.f
    65536 2 * constant #MAXTILES
    require ramen/tiled/tiled.f
    require ramen/lib/array2d.f

[section] variables
    0 value bgbank
    0 value sprbank
    0 value tinter

    \ tile size
    16 constant tw
    16 constant th

    struct layer
        layer 0 svar bg.scrollx
        layer 0 svar bg.scrolly

    objlist stage
        stage 256 pool: objects0
        stage 256 pool: objects1
        stage 256 pool: objects2

    \  the layers are orphan objects
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
    create window 0 , 48 , displayw , displayh 48 - ,

[section] init

\ load sprite data
" sprites.dat" file-exists [if]
    " sprites.dat" sprites /sprites @file
[then]
" sprites.f" file-exists [if]
    " sprites.f" included
[then]

: init
    " data/bg.png" findfile loadbmp to bgbank
    " data/spr.png" findfile loadbmp to sprbank
    bgbank tw th 1 maketiles >r
    sprbank tw th r> maketiles drop
    1024 for 1024 for  $10 rnd i j tilebuf loc !  loop loop
    nativewh *bmp to tinter
; init

[section] layers
: transformed
;
: drawsprlayer
    as  en @ -exit  transformed  objects0 drawzsorted
;
: scrollmap  ( x y w h -- )
    clip>
        window 2@ +at
        scrollx 2@ tw th scroll
            tilebuf loc  [ tilebuf pitch@ ]#  tilemap ;
: drawbglayer
    as  en @ -exit    transformed   window 4@ scrollmap
;
: layers
    {
    spr0 drawsprlayer
    bg0  drawbglayer
    spr1 drawsprlayer
    bg1  drawbglayer
    spr2 drawsprlayer
    }
;

[section] go
: think  stage each> act ;
: physics  stage each> vx x v+  y @ zdepth ! ;
: /step  step> think stage multi ;
: overworld show> grey backdrop background layers overlay ;
: go /step overworld ; go


[section] objtest
: *thing
    objects1 one
;
: test
    100 for  *thing  loop
; test

" data/world000.tmx" open-tilemap
    0 tmxlayer 0 0 load-tmxlayer


