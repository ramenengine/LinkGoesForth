
var dir
0 constant right
1 constant up
2 constant left
3 constant down

roledef actor


\ actor ( data -- <name> init-code ; )  ( objlist -- )
\   data:
\       mbx , mby , mbw , mbh ,  \ map hitbox
\ /actor  ( data -- )  initialize actor using given data
: /actor  @  mbx 4 imove  down dir ! ;
: does-actor  does> swap one  dup /actor  cell+ @ execute ;
: actor:   create does-actor  ( data ) ,  here 0 ,  :noname swap ! ;
    