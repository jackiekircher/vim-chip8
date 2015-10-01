Vim Chip8 Sytnax and Indentation
=================================

very basic Vim syntax highlighting and indentation rules for Chip8 assembly.
these rules will apply to any `*.8o` file.

##installation

clone the repository with
`git clone git@github.com:jackiekircher/vim-chip8.git`
or download the
[latest release](https://github.com/jackiekircher/vim-chip8/releases)
and copy the files into your Vim directory's corresponding ftdetect,
syntax, and indent folders. If you prefer to use Pathogen then that
should work too.


##SuperChip

the SuperChip instruction set is a backwards compatible extension of
Chip8 that adds, among other features, a higher resolution graphics mode
and screen scrolling. Syntax highlighting for these instructions is
disabled by default but you can enable them by uncommenting the
following line in syntax/8o.vim:

```VimL
"let b:superChip = 1
```

if you want to read more, go to the [SuperChip documentation](https://github.com/JohnEarnest/Octo/blob/gh-pages/docs/SuperChip.md)


##XO-Chip

the XO-Chip, much like the SuperChip, adds a variety of new instructions
that are also backwards compatible with Chip8. This includes new instructions
or updates to instructions that make working with an extended memory space
much easier/possible. to enable these uncomment the following line in syntax/8o.vim:

```VimL
"let b:xoChip    = 1
```

for more information here is the full [XO-Chip specification](https://github.com/JohnEarnest/Octo/blob/gh-pages/docs/XO-ChipSpecification.md)


##contributions

I don't have a lot of experience with Chip8 so if there are important rules that I
missed or you have indentation problems please let me know by opening an issue or
submitting a pull request!
