action turn     ( dir -- )
action forward  ( speed -- )
action back     ( speed -- )
action strafe   ( speed dir -- )
action attack   ( atk-type -- )
action hurt     ( AP -- )

rolevar attrs   \ bitmask
rolevar atk     \ multiplier
rolevar def     \ multiplier
rolevar sprbase \ index
