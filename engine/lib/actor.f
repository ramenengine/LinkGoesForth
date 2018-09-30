\ various extensions and functions
var z
: zofs  z @ negate peny +! ;
: uptile  dup tsize  -0.5 -1 2*  mbw 2@ 0.5 1 2*  2+  +at  tile ; 
: ztile  tint 4@ rgba  zofs  uptile ;
var til 
: draw>ztile  til ! draw> til @ ztile ;
: sinbounce+  ( n height speed -- n ) rot + dup -rot sin abs * z ! ;
: sinbounce  ( n height speed -- ) 2>r begin 2r@ sinbounce+ pause again ;

\ collision tool
: cbox  x 2@ mbw 2@ area 1 1 2- ;
0 value you
: with  me to you ;
: hit?  me you = if 0 exit then   cbox you >{ cbox } overlap? ;



\   The actordata is a mechanism by which you can have many types of actors
\ that share most of the same behavior but differ in some parameters.
\ Or the other way around.
\   actordata:
\       mbw , mbh ,  \ map hitbox
rolevar actordata
action start

\ actordata: ( -- )   define actor data of current roledef.  must be defined within a roledef.
: actordata:  here swap 's actordata ! ;
struct %actordata
    %actordata 0 svar ad.mbw
    %actordata 0 svar ad.mbh
    %actordata 0 svar ad.til

basis actordata:  16 , 8 ,
: actor:  defrole  lastrole @ actordata: ;

\ reloading actor scripts updates their code
\    (which may not take effect until user input due to old state remaining in memory)

: starts  ( objlist -- )  each>  role @ -exit  start ; 

\ /actor  ( role -- )  initialize actor using given role 

: draw>greeny  draw>  img @ if sprite+ exit then  mbw 2@ green rectf ;
: @actordata  actordata @ ad.mbw mbw 2 imove ;
: /actor  role !  @actordata  down dir !  1 priority !  draw>greeny  role @ -exit  start ;
: *actor  actors one /actor ;