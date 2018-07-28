
var dir
0 constant right
1 constant up
2 constant left
3 constant down

action idle
action walk

rolevar actordata

roledef: actor
;roledef

\ actor: ( actordata role -- <name> init-code ; )  ( objlist -- )
\   The actordata is a mechanism by which you can have many types of actors
\   that share most of the same behavior but differ in some parameters.
\   Or the other way around.

\   actordata ->
\       mbx , mby , mbw , mbh ,  \ map hitbox

\ /actor  ( role -- )  initialize actor using given role 

: /actor  @ role !  actordata @ mbx 4 imove  down dir ! ;
: does-actor  does> swap one  dup /actor  cell+ @ execute ;
: actor:   create does-actor  swap over 's actordata !  ( role ) ,  here 0 ,  :noname swap ! ;
