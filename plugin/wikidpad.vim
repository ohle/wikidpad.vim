function wikidpad#showUserTags(tags)
  let pattern='\(' . join(a:tags, '\|') . '\):'
  echom pattern
  exe 'vimgrep /' . pattern . '/j *.wiki'
  :cwindow
endfunction

function wikidpad#showQuickFix()
  
endfunction
