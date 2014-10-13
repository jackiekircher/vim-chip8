Vim Chip8 Sytnax and Indentation
=================================

very basic Vim syntax highlighting and indentation rules for Chip8 assembly.
these rules will apply to any `*.8o` file.

##installation

```
git clone git@github.com:jackiekircher/vim-chip8.git
```

clone the repository and copy the files into your Vim directory's
corresponding ftdetect, syntax, and indent folders. If you prefer to use
Pathogen then that should work too.


##optional keywords

if you would like to enable highlighting of extra statements then please uncomment the following
lines in syntax/8o.vim.

```VimL
hi def link chip8Functions  Function
```

this will add function highlighting to `save`, `load`, `sprite`, etc.


##SuperChip

aside from the `exit` keyword all SuperChip statements need to be added
in by uncommenting the following line in syntax/8o.vim

```VimL
hi def link superChip8Functions  Function
```

##contributions

I don't have a lot of experience with Chip8 so if there are important rules that I
missed or you have indentation problems please let me know by opening an issue or
submitting a pull request!
