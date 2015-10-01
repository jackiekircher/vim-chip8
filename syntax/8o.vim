" Vim syntax file
" Language:    CHIP-8
" Maintainer:  jackie kircher
" Filenames:   *.8o
" URL:         http://github.com/jackiekircher/vim-chip8
" Last Change: 2015-09-30
" Version:     1.0

if exists("b:current_syntax")
  finish
endif

"let b:superChip = 1
"let b:xoChip    = 1

syn keyword chip8Actions    return clear
syn keyword chip8Loops      loop again
syn keyword chip8Conditions if then begin else end while
syn keyword chip8Commands   contained alias unpack next breakpoint
syn keyword chip8Constants  const buzzer delay key
syn keyword chip8Functions  bcd save load sprite jump jump0

syn match chip8Comment "#.*$"
syn match chip8Label   "[-_a-zA-Z0-9]\+" contained
syn match chip8Number  "\<\d\+\>"
syn match chip8Number  "\<[-+]\d\+\>"
syn match chip8Number  "\<0x\x\{1,4}\>"
syn match chip8Number  "\<0b[0-1]\{1,8}\>"

syn region chip8CommandWrap start=":"   end="\s"         contains=chip8Commands
syn region chip8LabelWrap   start=":\s" end="\(\s\|\n\)" contains=chip8Label

hi def link chip8Actions    Statement
hi def link chip8Loops      Repeat
hi def link chip8Conditions Conditional
hi def link chip8Commands   Statement
hi def link chip8Comment    Comment
hi def link chip8Constants  Constant
hi def link chip8Functions  Function
hi def link chip8Label      Identifier
hi def link chip8Number     Number


" SuperChip instructions
if exists("b:superChip")
  syn keyword superChipActions   exit
  syn keyword superChipConstants bighex
  syn keyword superChipFunctions hires lores saveflags loadflags
  syn match   superChipFunctions "scroll-\(down\|left\|right\)\(\s\|\n\)"

  hi def link superChipActions    Statement
  hi def link superChipConstants  Constant
  hi def link superChipFunctions  Function
endif


" XO-Chip instructions
if exists("b:xoChip")
  syn keyword xoChipActions   audio
  syn keyword xoChipConstants long
  syn keyword xoChipFunctions plane
  syn match   xoChipFunctions "scroll-up"

  hi def link xoChipActions   Statement
  hi def link xoChipConstants Constant
  hi def link xoChipFunctions Function
endif
