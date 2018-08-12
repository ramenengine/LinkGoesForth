struct layer
    layer 0 svar bg.scrollx
    layer 0 svar bg.scrolly
\ the layers are orphan objects.  (layer objects describe the layers, they are not containers.)
objlist layers
    layers object: spr0 
    layers object: bg0  
    layers object: spr1 
    layers object: bg1  
    layers object: spr2 
\ extend objects: bg layer stuff
var scrollx
var scrolly
var tbi       \ tile base index
\ extend objects: transform info (used by layers too)
var sx  var sy  var ang
color sizeof field tint
