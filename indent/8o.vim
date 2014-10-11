" Vim indent file
" Language:	   CHIP-8
" Maintainer:	 jackie kircher
" URL:         http://github.com/jackiekircher/chip8-vim
" Last Change: 2014-10-10
" Version:     0.1

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=Get8oIndent()
setlocal indentkeys=o,O,=,!^F,0=again,<:>,0;

if exists("*Get8oIndent")
  finish
endif

function! s:prevloop(lnum)
  let nline = a:lnum
  while nline > 0
    let nline = prevnonblank(nline-1)
    if getline(nline) =~ '^\s*loop'
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

  if currentline =~ '^\s*again'
    return indent(s:prevloop(v:lnum))
  elseif currentline =~ '^\s*;'
    return 0
  elseif currentline =~ '^\s*:'
    return 0

  elseif line =~ '^:\s'
    return indent + &sw
  elseif line =~ 'loop'
    return indent + &sw

  else
    return -1
  endif

endfunction
