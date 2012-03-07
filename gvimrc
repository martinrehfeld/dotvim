" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Inconsolata:h16       " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=L
set guioptions-=r
set background=light              " Background.
set lines=62 columns=204          " Window dimensions.
set foldcolumn=5
set list

set relativenumber
autocmd BufEnter * set relativenumber

set fuoptions=maxvert,maxhorz
map <leader>f :set invfullscreen<CR>

let g:rubytest_cmd_feature = "cucumber --no-color %p"
let g:rubytest_cmd_story = "cucumber --no-color %p -n '%c'"

set background=light
colorscheme solarized
hi NonText term=bold ctermfg=9 gui=NONE guifg=#555555

set cuc cul
hi! link CursorLine CursorColumn

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
endif
