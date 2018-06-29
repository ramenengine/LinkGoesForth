include afkit/ans/section

[section] preamble
empty
$000100 include ramen/brick
65536 2 * constant #MAXTILES
include ramen/tiled/tilegame
$000100 include ramen/lib/array2d

[section] variables
    0 value bgbank
    0 value sprbank

    struct layer
        layer 0 svar bg.scrollx
        layer 0 svar bg.scrolly

    1024 1024 array2d: tilebuf

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

    defer background  :is background ;
    defer overlay     :is overlay ;

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
    bgbank 16 16 0 maketiles >r
    sprbank 16 16 r> maketiles drop
; init

[section] window
    \ TODO
: -window ;
: +window ;

[section] layers
: transformed
    \ noop for now
;
: drawsprlayer
    as  en @ -exit  transformed  objects0 drawzsorted
;
: drawbglayer
    as  en @ -exit  transformed  tbi @ tilebase!  scrollx 2@ tsize scroll  tilebuf loc  tilebuf pitch@  tilemap
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

[section] mainloops
: think  stage each> act ;
: physics  stage each> vx x v+  y @ zdepth ! ;
: /step  step> think stage multi ;
: overworld show> -window grey backdrop +window background layers -window overlay ;
: go /step overworld ;

