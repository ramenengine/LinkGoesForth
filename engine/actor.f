
var dir
0 constant right
1 constant up
2 constant left
3 constant down

\   The actordata is a mechanism by which you can have many types of actors
\ that share most of the same behavior but differ in some parameters.
\ Or the other way around.
\   actordata:
\       mbx , mby , mbw , mbh ,  \ map hitbox
rolevar actordata

\ actordata: ( -- )   define actor data of current roledef.  must be defined within a roledef.
: actordata:  here actordata ! ;

roledef: actor
    actordata:  0 , 0 , 16 , 16 , 
;roledef

\ reloading actor scripts updates their code
\    (which may not take effect until user input due to old state remaining in memory)
\ refreshing clears all objects with no role and reloads the map,
\    but leaves all objects with a role alone and tries to execute START on them.
action start
actor :to start ;


\ /actor  ( role -- )  initialize actor using given role 
\ actor: ( role -- <name> )  ( objlist -- )

: draw>greeny  draw>  16 16 green rectf ;
: /actor  role !  actordata @ mbx 4 imove  down dir ! ;
: does-actor  does>  swap one  draw>greeny  @ /actor  start ;
: actor:   create does-actor  ( role ) ,  ;
