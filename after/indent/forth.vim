" if other was loaded, don't load this file
" if exists("b:did_indent")
"   finish
" endif
" let b:did_indent = 1

setlocal autoindent

setlocal indentexpr=GetForthIndent(v:lnum)
setlocal indentkeys=!^F,o,O,0:,;

setlocal expandtab

function! GetForthIndent(lnum)
  let plnum = prevnonblank(a:lnum - 1)
  if plnum == 0
    return 0
  endif
  let pline = getline(plnum)
  let cline = getline(a:lnum)

  if pline =~ '^:\s*'
    return indent(plnum) + &l:shiftwidth
  endif

  if cline =~ '\s;'
    return 0
  endif

  return plnum
endf

" vim:sw=2
