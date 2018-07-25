
: think  stage each> act ;
: physics  stage 16 collide-objects-map  stage each>  vx 2@ x 2+!  y @ zdepth ! ;
: /step  step> think stage multi physics ;
: overworld  show> black backdrop background layers ;
: go  /step overworld ; go
