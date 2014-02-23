function! wikidpad#syntaxGroupUnderCursor()
  return synIDattr(synID(line("."), col("."), 0), "name")
endfunction

function! wikidpad#onElement(name)
  if (wikidpad#syntaxGroupUnderCursor() ==# a:name)
    return 1
  else
    return 0
  endif
endfunction

function! wikidpad#onWikiWord()
  return wikidpad#onElement("wikidpadWikiWord")
endfunction

function! wikidpad#onLink()
 return wikidpad#onElement("wikidpadLink")
endfunction


" Mappings for user tag actions
nnoremap <leader>wt :call wikidpad#showUserTags(['todo','done'])<cr>
nnoremap <leader>wa :call wikidpad#showUserTags(['action'])<cr>
nnoremap <leader>wi :call wikidpad#showUserTags(['issue'])<cr>
nnoremap <leader>wq :call wikidpad#showUserTags(['question'])<cr>

"mappings for following links
nnoremap <leader>ww :call wikidpad#openWikiWord()<cr>
