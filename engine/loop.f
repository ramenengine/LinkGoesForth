depend engine/lib/drawzsorted.f
depend engine/lib/layers.f

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
        spr0 as actors 0 drawsprlayer
        bg0 as tilebuf0   drawbglayer
        spr1 as actors 1 drawsprlayer
        bg1 as tilebuf1   drawbglayer
        spr2 as actors 2 drawsprlayer
        hud
    }
;

: multi+acts  dup multi acts ;
: move/map  1 tsize drop collide-objects-map ;
: physics  stage dup move/map  each>  vx 2@ x 2+!  y @ mbh @ + zdepth ! ;
: gamev  game each> vx 2@ x 2+! ;
: /game  step>  stage multi+acts  physics  game multi+acts  gamev  ;
: hitbox  x 2@ at  mbw 2@ red rect ;
: ?info  info @ -exit  scrolled  stage each> hitbox ;
: overworld  /game  show>  black backdrop  layers  ?info ;

