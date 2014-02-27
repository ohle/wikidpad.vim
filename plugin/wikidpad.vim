function wikidpad#showUserTags(tags)
  let pattern='\(' . join(a:tags, '\|') . '\):'
  echom pattern
  exe 'vimgrep /' . pattern . '/j *.wiki'
  :cwindow
endfunction

function! wikidpad#openWikiWord()
  if (!wikidpad#onWikiWord())
    echom "Not a WikiWord!"
    return
  endif
  if (&modified)
    echom "Buffer has unsaved changes"
    return
  endif

  let word       = expand("<cword>")
  let linkedFile = word . ".wiki"

  exec "edit " . linkedFile
  if (!filereadable(linkedFile))
    execute "normal! ggO++ ".word
    normal! oG
    startinsert 
  endif
endfunction

function! wikidpad#openLink()
  if (!wikidpad#onLink())
    echom "Not a Link!"
    return
  endif
  exec "edit " . wikidpad#curlink()
endfunction
