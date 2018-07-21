    require src/engine.f
    
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
    1 constant up
    2 constant right
    3 constant down
    4 constant left
    
    roledef actor
        1 actor spd !
        
    
