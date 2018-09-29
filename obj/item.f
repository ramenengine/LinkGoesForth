\ collectibles
defrole item
var kind  \ index
    
struct %kind
    %kind 0 svar kind.mbw
    %kind 0 svar kind.mbh
    %kind 0 svar kind.til


create rupee  2 , 16 , 0 ,
create heart  8 , 8 ,  1 , 
create arrow  2 , 16 , 2 ,
    
table: kinds
    ( 0 ) rupee ,
    ( 1 ) heart ,
    ( 2 ) arrow ,
;table

: kind@  kind @ kinds nth @ ;
: kindtile@  kind@ kind.til @ ;
: !box  kind@ 2@ mbw 2! ;

: ?item  ( n/adr -- n )  dup kinds #pushed < ?exit
    kinds #pushed for  i kinds nth @ over = if drop i unloop exit then  loop
    drop 0 ; 
\ : ?item  dup kinds #pushed < if kinds nth @ then ;
: /item  ?item kind !  !box  kindtile@ items-gid + draw>ztile ;
: *item  ( n )  item *actor  /item ;
item :recipe  mapdat gid@ items-gid - *item ;
