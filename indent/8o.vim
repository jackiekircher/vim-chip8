" Vim indent file
" Language:	   CHIP-8
" Maintainer:	 jackie kircher
" URL:         http://github.com/jackiekircher/vim-chip8
" Last Change: 2015-09-30
" Version:     1.0

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

function! s:prevmatch(lnum, startstring, endstring)
  let nline = a:lnum
  let blockcount = 0
  while nline > 0
    let nline = prevnonblank(nline-1)
    let line  = getline(nline)

    if line =~ a:endstring
      let blockcount += 1
    elseif line =~ a:startstring
      let blockcount -= 1
      if blockcount < 0
        break
      endif
    endif
  endwhile

  return indent(nline)
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
    return s:prevmatch(v:lnum, '^\s*loop', '^\s*again')

  " beginning/end of an else clause
  elseif currentline =~ '^\s*\(else\|end\)'
    return s:prevmatch(v:lnum, '^\s*if.*begin$', '^\s*end')

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
