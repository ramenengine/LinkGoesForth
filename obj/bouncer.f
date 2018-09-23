\ bouncy pink thing
require engine/lib/actor.f

defrole bouncer
    
var starty
: draw-bouncer  draw> 0 -8 +at  65 tile ;
bouncer :to start  y @ starty !  2 priority !  draw-bouncer 0 perform>
    begin 4 + dup sin abs negate 16 * starty @ + y ! pause again ;

bouncer actor: /bouncer

: *bouncer  objects one /bouncer ;
