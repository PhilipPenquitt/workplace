syntax enable " enable syntax processing

set expandtab " tabs are spaces
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu

set lazyredraw          " redraw only when we need to.

set showmatch           " highlight matching [{()}]

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

set ruler " show me a ruler

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>


augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
"    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set relativenumber
set ruler
set linebreak
set laststatus=2

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

set wildmode=list:longest

" Pathogeninfect
" execute pathogen#infect()
" syntax on
" filetype plugin indent on

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

Plug 'MicahElliott/Rocannon'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jmcantrell/vim-virtualenv'

" Initialize plugin system
call plug#end()

"Zeigen immer die Tabline
set showtabline=2

autocmd BufNewFile,BufRead *.yml   set syntax=ansible
autocmd BufNewFile,BufRead *.yaml   set syntax=ansible

"autocompletion mit ctrl Space
inoremap <Nul> <C-x><C-o>

" Smarter Tabline
let g:airline#extensions#tabline#enabled = 1

" Bewegungen zwischen den Tabs
nnoremap <C-t>     :tabnew<CR>
"Es kann mit ctrl t immer ein neuer Tab aufgemacht werden
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap tf  :tabfirst<CR>
nnoremap tp  :tabprevious<CR>
nnoremap tl  :tablast<CR>
nnoremap te  :tabedit<Space>
nnoremap tn  :tabnext<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
