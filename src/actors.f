require engine/engine.f

action turn     ( dir -- )
action forward  ( speed -- )
action back     ( speed -- )
action strafe   ( speed dir -- )
action attack   ( atk-type -- )
action hurt     ( AP -- )

rolevar attrs   \ bitmask
rolevar atk     \ multiplier
rolevar def     \ multiplier
rolevar spd     \ multiplier

rolevar sprbase \ index

var dir

roledef actor
    1 actor spd !

\ actor ( data -- <name> init-code ; )  ( objlist -- )
\   data:
\       mbx , mby , mbw , mbh ,  \ map hitbox
\ /actor  ( data -- )  initialize actor using given data
: /actor  @  mbx 4 imove ;
: does-actor  does> swap one  dup /actor  cell+ @ execute ;
: actor:   create does-actor  ( data ) ,  here 0 ,  :noname swap ! ;
    