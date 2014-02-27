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

function! wikidpad#escapeWikiLink(s)
  return join(split(a:s, "/"), "%2F")
endfunction

function! wikidpad#unescapeWikiLink(s)
  return join(split(a:s, "%2F"), "/")
endfunction

function! wikidpad#expandRelativePath(fromfile, linkstring)
  let fromparts = split(a:fromfile, "%2F")
  let toparts   = split(a:linkstring, "/")
endfunction

function! wikidpad#curlink()
  if (!wikidpad#onLink())
    return ""
  endif
  let backupregister=@a
  execute "normal! F[lv/[]|]\<cr>h\"ay"
  nohlsearch
  let target=wikidpad#escapeWikiLink(@") . ".wiki"
  let @a=backupregister
  return fnameescape(target)
endfunction

" Mappings for user tag actions
nnoremap <buffer> <leader>wt :call wikidpad#showUserTags(['todo','done'])<cr>
nnoremap <buffer> <leader>wa :call wikidpad#showUserTags(['action'])<cr>
nnoremap <buffer> <leader>wi :call wikidpad#showUserTags(['issue'])<cr>
nnoremap <buffer> <leader>wq :call wikidpad#showUserTags(['question'])<cr>

"mappings for following links
nnoremap <buffer> <leader>ww :call wikidpad#openWikiWord()<cr>
nnoremap <buffer> <leader>wl :call wikidpad#openLink()<cr>

" Automatic fomrmatting of lists
setlocal formatlistpat=^\\s*\\([0-9]\\+\\.\\\|\\*\\)\\s\\+
setlocal formatoptions=tn
