include ws1/ws1.f
: label"  [char] " parse label ;
: button" [char] " parse button ;

: plunk  p1 0 0 away ;

label" --- Zelda --- "
nr label" Reload test.f and restart objects: "
nr button" upd"  button" stage starts"
nr label" Spawn stuff: "
nr button" plunk *bouncer"
nr label" Warp around: "
nr button" 0 0 warp"
