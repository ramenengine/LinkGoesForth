\ various extensions and functions
var z
: zofs  z @ negate peny +! ;
: uptile  dup tsize  -0.5 -1 2*  mbw 2@ 0.5 1 2*  2+  +at  tile ; 
: ztile  tint 4@ rgba  zofs  uptile ;
var til 
: draw>ztile  til ! draw> til @ ztile ;
: sinbounce+  ( n height speed -- n ) rot + dup -rot sin abs * z ! ;
: sinbounce  ( n height speed -- ) 2>r begin 2r@ sinbounce+ pause again ;



\   The actordata is a mechanism by which you can have many types of actors
\ that share most of the same behavior but differ in some parameters.
\ Or the other way around.
\   actordata:
\       mbw , mbh ,  \ map hitbox
rolevar actordata
action start

\ actordata: ( -- )   define actor data of current roledef.  must be defined within a roledef.
: actordata:  here swap 's actordata ! ;
basis actordata:  16 , 8 ,

\ reloading actor scripts updates their code
\    (which may not take effect until user input due to old state remaining in memory)

: starts  ( objlist -- )  each>  role @ -exit  start ; 

\ /actor  ( role -- )  initialize actor using given role 

: draw>greeny  draw>  img @ if sprite+ exit then  mbw 2@ green rectf ;
: @actordata  actordata @ mbw 2 imove ;
: /actor  role !  @actordata  down dir !  1 priority !  draw>greeny  role @ -exit  start ;
: *actor  objects one /actor ;