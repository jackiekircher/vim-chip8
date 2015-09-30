" Vim indent file
" Language:	   CHIP-8
" Maintainer:	 jackie kircher
" URL:         http://github.com/jackiekircher/vim-chip8
" Last Change: 2014-10-10
" Version:     0.1

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=Get8oIndent()
setlocal indentkeys=o,O,=,!^F,0=again,0=else,0=end,<Space>,0;

if exists("*Get8oIndent")
  finish
endif

function! s:prevMatch(lnum, matchString)
  let nline = a:lnum
  while nline > 0
    let nline = prevnonblank(nline-1)
    if getline(nline) =~ a:matchString
      break
    endif
  endwhile

  return nline
endfunction

function! Get8oIndent()
  let pnum   = prevnonblank(v:lnum-1)
  let line   = getline(pnum)
  let indent = indent(pnum)

  let currentline   = getline(v:lnum)
  let currentindent = indent(v:lnum)


  "--- set indent to a specific column ---"

  " end of a loop
  if currentline =~ '^\s*again'
    return indent(s:prevMatch(v:lnum, '^\s*loop$'))

  " beginning/end of an else clause
  elseif currentline =~ '^\s*\(else\|end\)'
    return indent(s:prevMatch(v:lnum, '^\s*if.*begin$'))

  " creating a new label
  elseif currentline =~ '^\s*:\s'
    return 0

  " closing a subroutine
  elseif currentline =~ '^\s*;'
    return 0


  "--- indent the next line ---"

  " labels
  elseif line =~ '^:\s'
    return indent + &sw

  " loops
  elseif line =~ '^\s*loop$'
    return indent + &sw

  " while
  elseif line =~ '^\s*while\s'
    return indent + &sw

  " if blocks (denoted by 'begin')
  elseif line =~ '^\s*if.*begin$'
    return indent + &sw

  " else blocks
  elseif line =~ '^\s*else$'
    return indent + &sw


  " don't change the indent
  else
    return -1
  endif

endfunction
