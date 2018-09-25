\ bouncy pink thing
require engine/lib/actor.f

order
defrole bouncer
var bounce-y
: >bounce  sin abs negate 24 * ;
: draw-bouncer  draw> 0 0 bounce-y @ + +at  65 tile ;
bouncer :to start  draw-bouncer 0 perform>
    begin 4 + dup >bounce bounce-y !  pause again ;

bouncer actor: /bouncer
: *bouncer  objects one /bouncer ;
bouncer :recipe *bouncer ;
