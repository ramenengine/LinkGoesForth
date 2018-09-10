true constant dev
true constant allegro-debug
include src/main.f
include src/test.f
[in-platform] sf [if]
    include ramen/ide/ide.f
    'source-id @ close-file drop
    ide
[then] 