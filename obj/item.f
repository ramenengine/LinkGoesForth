\ collectibles
defrole item
var kind  \ index
    
struct %kind
    %kind 0 svar kind.mbw
    %kind 0 svar kind.mbh


create rupee  2 , 16 , 
create heart  8 , 8 ,  
create arrow  2 , 16 , 
    
table: kinds
    ( 0 ) rupee ,
    ( 1 ) heart ,
    ( 2 ) arrow ,
;table

: kind@  kind @ kinds nth @ ;
: kindtile@  kind @ ;
: !box  kind@ 2@ mbw 2! ;

: ?item  ( n/adr -- n )  dup kinds #pushed < ?exit
    kinds #pushed for  i kinds nth @ over = if drop i unloop exit then  loop
    drop 0 ; 
: /item  ?item kind !  !box  kindtile@ items-gid + draw>ztile ;
: *item  ( n )  item *actor  /item ;
item :recipe  mapdat gid@ items-gid - *item ;
