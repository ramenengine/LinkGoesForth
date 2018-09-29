#1 #0 #2 [ws1] [checkver]
: toggle  dup @ not swap ! ;
: clean   wipe /s info off repl off ;
figure blank
s" --- Zelda ---" label
nr s" Reload test.f and restart objects:" label
nr s" ld test" button   
nr s" Spawn stuff:" label
nr s" plunk *bouncer" button
nr s" Warp around:" label
   s" 0 0 warp" button
nr s" Reset:" label 
   s" cold" button   s" warm" button  s" stop"  button
nr s" Housekeeping:" label
   s" ld workspace" button
   s" clean" button
nr s" Toggle hitboxes etc: (same as alt-tilde)" label
   s" info toggle" button