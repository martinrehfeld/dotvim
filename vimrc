set history=1000
let mapleader = ","
set shortmess=atI
set listchars=nbsp:•,eol:¬,tab:→ ,extends:»,precedes:«,trail:▫
set list
map <Leader>m <Plug>MakeGreen     " free <Leader>t
let g:solarized_visibility = 'normal'
let g:rubytest_in_quickfix = 1
let g:rubytest_cmd_feature = "cucumber --no-color %p"
let g:rubytest_cmd_story = "cucumber --no-color %p -n '%c'"
let g:rubycomplete_rails = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeStatusline = "NERDTree"
let g:NERDTreeWinSize = 35
let g:LustyJugglerSuppressRubyWarning = 1
let g:erlangHighlightBif = 1
let g:erlangFold = 1
let g:erlangFoldSplitFunction = 0
let g:erlangManPath = '/usr/local/erlang/man'
let g:delimitMate_balance_matchpairs = 1
let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['sass']
let g:PreviewBrowsers='open'

silent! call pathogen#runtime_append_all_bundles()

call pathogen#helptags()

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

" Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set relativenumber                " Show relative line numbers.
autocmd BufEnter * set relativenumber

set foldcolumn=3

set ruler                         " Show cursor position.
set cuc cul                       " ... including the column
hi! link CursorLine CursorColumn

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set linebreak
set formatoptions=qn1
set wrapmargin=4
set textwidth=79
set cursorline

set splitbelow                    " Split windows below the current window.
set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set smarttab

set laststatus=2                  " Show the status line all the time
set autoindent
set smartindent

set clipboard=unnamed             " use system clipboard by default

set shell=/bin/bash               " Some commands seem to have problems with zsh

set wildignore+=vendor,log,rel,tmp,*.swp,*.swo,*.beam,*.png,*.jpeg,*.jpg,*.gif,*.o,*.elc,*.rbc,*.pyc,*.pds,*.ai,*.pdf,*.mov,*.aep,*.dmg,*.zip,*.gz,*.tar
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

" Color mappings.
set background=light
colorscheme solarized
highlight SpellBad term=reverse ctermfg=White ctermbg=Red gui=undercurl guisp=Red

" Tab mappings.
map <Leader>tt :tabnew<cr>
map <Leader>te :tabedit
map <Leader>tc :tabclose<cr>
map <Leader>to :tabonly<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>
map <Leader>tf :tabfirst<cr>
map <Leader>tl :tablast<cr>
map <Leader>tm :tabmove
" (this takes a while as the tab mappings need to timeout first)
map <Leader>t :CommandT<cr>
" therefore provide a quick access to command-t
map <C-p> :CommandT<cr>

map <Leader>r <Plug>RubyTestRun " change from <Leader>t to <Leader>\
map <Leader>R <Plug>RubyFileRun " change from <Leader>T to <Leader>]
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Map next/prev buffer to <C-Tab> / <C-S-Tab>
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

map <Leader>b :FufBuffer<cr>

" Get rid of awkward Ex-mode
map Q <Esc>

imap <C-l> <space>=><space>

" unhighlight on <C-l>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby   setlocal foldmethod=syntax
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" folding customization
autocmd BufRead * normal zR
nnoremap <space> za

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" remove trailing whitespace on save
function TrimSpaces()
  if !&binary && &filetype != 'diff'
    %s/\(^--\)\@<!\s*$//ge
    ''
  end
endfunction
autocmd FileWritePre * :silent! call TrimSpaces()
autocmd FileAppendPre * :silent! call TrimSpaces()
autocmd FilterWritePre * :silent! call TrimSpaces()
autocmd BufWritePre * :silent! call TrimSpaces()

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
autocmd BufNewFile,BufRead *_spec.rb set ft=rspec

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au FileType markdown,textile setlocal spell spelllang=en_us

au InsertEnter * hi StatusLine ctermbg=white ctermfg=darkred
au InsertLeave * hi StatusLine ctermbg=white ctermfg=black

" automatically clean up closed fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

function! DiffOrig()
  if &diff
    wincmd p | bdel | diffoff
  else
    vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
  endif
endfunction
map <leader>e :call DiffOrig()<cr>
