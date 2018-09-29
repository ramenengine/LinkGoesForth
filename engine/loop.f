require engine/lib/drawzsorted.f
require engine/lib/layers.f

: scrolled
    mount
        m1 cam 's x 2@ 2negate gscale 2af al_translate_transform
        m1 window 2@ gscale 2af al_translate_transform
        m1 al_use_transform ;

: drawsprlayer  ( list priority -- )
    en @ 0= if  2drop  exit then
    scrolled  drawzsorted  mount ;

: windowmap  ( array2d -- )
    mount
    window 4@ clip>
        window 2@ at
        scrollx 2@ tw th scrollofs
            third loc  swap pitch@  tilemap ;

: drawbglayer  ( array2d )
    en @ 0= if drop exit then    
    cam 's x 2@ scrollx 2!
    windowmap
;

: layers
    {
        background 
        hud
        spr0 as objects 0 drawsprlayer
        bg0 as tilebuf0   drawbglayer
        spr1 as objects 1 drawsprlayer
        bg1 as tilebuf1   drawbglayer
        spr2 as objects 2 drawsprlayer
    }
;

: think  stage each> act ;
: move/map  tsize drop collide-objects-map ;
: physics  objects dup move/map  each>  vx 2@ x 2+!  y @ zdepth ! ;
: gamev  game each>  vx 2@ x 2+! ;
: /game  step>  think  stage multi  physics  game multi  gamev  ;
: hitbox  x 2@ at  mbw 2@ red rect ;
: ?info  info @ -exit  scrolled  objects each> hitbox ;
: overworld  /game  show>  black backdrop  layers  ?info ;

