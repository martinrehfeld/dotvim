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
let g:NERDTreeShowLineNumbers = 0
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
let g:syntastic_erlc_include_path = '-rebar rebar.config'
let g:PreviewBrowsers='open'
let g:gundo_close_on_revert = 1
let g:Gitv_TruncateCommitSubjects = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0

" ctags
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1
let Tlist_Compact_Format=1
set updatetime=1000
set tags=tags; " The ';' at the end will cause the ctags plugin to search for current dir and above dirs until it find a tag file.
nmap ,c :!(cd %:p:h;ctags *)& " Maps the updates of tags to <leader>c

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

set autoread                      " automatically re-read changed files

set nonumber
set foldcolumn=4

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
set lazyredraw

set splitbelow                    " Split windows below the current window.
set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " no swap files

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set smarttab

set laststatus=2                  " Show the status line all the time
set autoindent
set smartindent

set clipboard=unnamed             " use system clipboard by default

set shell=/bin/bash               " Some commands seem to have problems with zsh

set wildignore+=vendor,deps,output,doc,log,rel,ebin,tmp,*.swp,*.swo,*.beam,*.png,*.jpeg,*.jpg,*.gif,*.o,*.elc,*.rbc,*.pyc,*.pds,*.ai,*.pdf,*.mov,*.aep,*.dmg,*.zip,*.gz,*.tar
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

" Color mappings.
set background=light
colorscheme solarized

" Spell checker
highlight SpellBad ctermfg=9 gui=undercurl guisp=Red
set spellsuggest=8

" abbreviations
cabbrev git Git
cabbrev ack Ack

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

map <Leader>r <Plug>RubyTestRun
map <Leader>R <Plug>RubyFileRun
map <Leader>d :execute 'NERDTreeMirrorToggle'<CR>
map <Leader>u :execute 'GundoToggle'<CR>
map <Leader>b :FufBuffer<cr>

" Map next/prev buffer to <C-Tab> / <C-S-Tab>
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Get rid of awkward Ex-mode
map Q <Esc>

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
nmap <leader>gs :Gstatus<cr>

imap <C-l> <space>=><space>

" unhighlight on <C-l>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" dot command in VISUAL (applies to every selected line)
:vnoremap . :norm.<cr>

" folding customization
autocmd BufRead * normal zR
nnoremap <space> za

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" remove trailing whitespace on save
function! TrimSpaces()
  if !&binary && &filetype != 'diff'
    %s/\(^---\?\)\@<!\s*$//ge
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

" Haskell dev tools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

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
