: gscale  initial-scale dup 2p 2* ;


: drawsprlayer  ( list priority -- )
    en @ 0= if  2drop  exit then
    unmount
    m1 cam 's x 2@ 2negate gscale 2af al_translate_transform
    m1 window 2@ gscale 2af al_translate_transform
    m1 al_use_transform
    drawobjects
    unmount
    ;

: windowmap  ( array2d -- )
    window 4@ clip>
        window 2@ at
        scrollx 2@ tw th scroll
            third loc  swap pitch@  tilemap ;

: drawbglayer
    en @ 0= if drop exit then    
    cam 's x 2@ scrollx 2!
    windowmap
;

: layers
    {
        spr0 as objects 0 drawsprlayer
        bg0 as tilebuf0   drawbglayer
        spr1 as objects 1 drawsprlayer
        bg1 as tilebuf1   drawbglayer
        hud
        spr2 as objects 2 drawsprlayer
    }
;