true constant dev
true constant allegro-debug
include main.f
include test.f
[in-platform] sf [if]
    include ramen/ide/ide.f
    'source-id @ close-file drop
    ide
[then] 