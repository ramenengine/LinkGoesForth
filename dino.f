include ramen/ramen.f
depend ramen/stdpack.f

stop                                   \ reset the engine
s" data/dinobaby.png" image: myimage   \ declare the image
500 300 at
stage object: myobj  \ create a static object at 100,100
myimage img !        \ set the object's image
10 10 sx 2!          \ scale it 10X
45 ang !             \ rotate it 45 degrees
12 12 cx 2!          \ set the center of rotation to 12,12
:now  draw> sprite+ ;  \ this activates sprite rendering for the object
\ get extra fancy; make it spin!
:now  draw> sprite+  1 ang +! ;