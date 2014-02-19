if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "wikidpad"

syn case match " make syntax rules case sensitive

syn region wikidpadBold    start=/\*\w/ skip=/\\\*/ end=/\*/ contains=wikidpadItalic
syn region wikidpadItalic start=/_/ skip=/\\_/ end=/_/      contains=wikidpadBold
syn match wikidpadHeading "^[+].*$"

" directly from html-syntax {{{
syn match   htmlValue    contained "=[\t ]*[^'" \t>][^ \t>]*"hs=s+1   contains=javaScriptExpression,@htmlPreproc
syn region  htmlEndTag             start=+</+      end=+>+ contains=htmlTagN,htmlTagError
syn region  htmlTag                start=+<[^/]+   end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagError contained "[^>]<"ms=s+1
" }}}

highlight link wikidpadBold htmlBold
highlight link wikidpadItalic htmlItalic
" highlight link wikidpadHeading htmlHead
highlight wikidpadHeading ctermfg=red
