\ TODO


[section] variables
    struct sprite
        sprite 0 svar sprite.bank
        sprite 0 svar sprite.reserved
        sprite 0 %rect sizeof sfield sprite.rect
        sprite 0 svar sprite.orgx
        sprite 0 svar sprite.orgy

    sprite sizeof 65536 *
        dup constant /sprites
            buffer: sprites

[section] defsprites
