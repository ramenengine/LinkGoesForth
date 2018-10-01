\ collectibles

actor: rupee  2 , 16 , 0 ,
actor: heart  8 , 8 ,  1 ,
actor: arrow  2 , 16 , 2 ,
    
table: kinds
    ( 0 ) rupee ,
    ( 1 ) heart ,
    ( 2 ) arrow ,
;table

: til@  actordata @ ad.til @ ;
: !box  actordata @ ad.mbw 2@ mbw 2! ;
: /item  !box  til@ items-gid + draw>ztile ;
: *item  ( n )  kinds nth @ *actor  /item ;
defrole item  \ used to connect Tiled, must be last
item :recipe  mapdat gid@ items-gid - *item ;
