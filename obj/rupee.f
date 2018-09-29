\ rupee collectible
require engine/lib/actor.f
defrole rupee
rupee :to start  16 16 mbw 2!  67 draw>ztile ;
: *rupee  rupee *actor ;
rupee :recipe *rupee ;
