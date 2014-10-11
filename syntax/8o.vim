" Vim syntax file
" Language:    CHIP-8
" Maintainer:  jackie kircher
" Filenames:   *.8o
" URL:         http://github.com/jackiekircher/chip8-vim
" Last Change: 2014-10-10
" Version:     0.1

if exists("b:current_syntax")
  finish
endif

syn keyword chip8Actions    return clear
syn keyword chip8Loops      loop again
syn keyword chip8Conditions if then
syn keyword chip8Commands   alias unpack
syn keyword chip8Constants  const
syn keyword chip8Functions  bcd save load sprite jump jump0

syn keyword superChip8Actions   exit
syn keyword superChip8Functions hires lores bighex saveflags loadflags
syn keyword superChip8Functions scroll-down scroll-left scroll-right

syn match chip8Comment "#.*$"
syn match chip8Label   "[-_a-zA-Z0-9]\+" contained
syn match chip8Number  "\<\d\+\>"
syn match chip8Number  "\<[-+]\d\+\>"
syn match chip8Number  "\<0x\x\{1,2}\>"
syn match chip8Number  "\<0b[0-1]\{1,8}\>"

syn region  chip8Procedure start=":\s" end="\s" contains=chip8Label


hi def link chip8Actions    Statement
hi def link chip8Loops      Repeat
hi def link chip8Conditions Conditional
hi def link chip8Commands   Statement
hi def link chip8Constants  Constant
"hi def link chip8Functions  Function

hi def link chip8Comment    Comment
hi def link chip8Label      Identifier
hi def link chip8Number     Number

hi def link superChip8Actions    Statement
"hi def link superChip8Functions  Function
