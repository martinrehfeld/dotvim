" Vim graphical configuration.

set guifont=Inconsolata:h15  " Font family and font size.
set antialias                " MacVim: smooth fonts.
set encoding=utf-8           " Use UTF-8 everywhere.
set guioptions-=T            " Hide toolbar.
set guioptions-=L
set guioptions-=r
set background=light         " Background.
set lines=62 columns=204     " Window dimensions.

set fuoptions=maxvert,maxhorz
map <leader>f :set invfullscreen<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
endif
