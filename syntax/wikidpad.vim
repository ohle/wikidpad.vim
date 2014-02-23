if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "wikidpad"

syn case match " make syntax rules case sensitive

syn region wikidpadLink      start=/\[/ end=/]/ contains=wikidpadLinkText
syn region wikidpadLinkText  start=/|/ end=/.]\@=/ contained contains=wikidpadBold,wikidpadItalic,wikidpadEntity
syn region wikidpadTable     start=/^\s*<<|/   end=/\s*>>/ contains=wikidpadItalic,wikidpadBold,wikidpadEntity,wikidpadLink
syn region wikidpadBold      start=/\*\S\@=/ skip=/\\\*/ end=/\S\@<=\*/ contains=wikidpadItalic,wikidpadEntity
syn region wikidpadItalic    start=/_/ skip=/\\_/ end=/_/ contains=wikidpadBold,wikidpadEntity
syn match  wikidpadEntity    "\v\&\w+;"
syn match  wikidpadHeading   "^[+].*$"
syn match  wikidpadUserTag   "\v(todo|done|action|track|issue|question|project):"
syn match wikidpadWikiWord   "[\w|\\]\@<![A-Z]\w*[a-z][A-Z]\w*"

highlight link wikidpadBold    Underlined
highlight link wikidpadItalic  Underlined
highlight link wikidpadEntity  SpecialChar
highlight link wikidpadLink    Identifier
highlight link wikidpadHeading Statement
highlight link wikidpadUserTag Todo
highlight link wikidpadWikiWord Identifier
