\ bouncy pink thing
require engine/lib/actor.f
defrole bouncer
bouncer :to start  16 16 mbw 2!  65 draw>ztile
    180 rnd perform> 24 3 sinbounce ;
: *bouncer  bouncer *actor ;
bouncer :recipe *bouncer ;
