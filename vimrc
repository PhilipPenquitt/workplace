" VUNDLE DETAILS:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'pearofducks/ansible-vim'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ENDE VUNDLE DETAILS

" Andres Zeug:
syntax enable " enable syntax processing

set expandtab " tabs are spaces
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set wildmode=list:longest

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

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set number
set relativenumber
set ruler
set linebreak
set laststatus=2
" Es wird Case insensitiv gesucht
set ignorecase

"Zeigen immer die Tabline
set showtabline=2

"Mittels f3 und f4 können Zahlen deaktiviert und aktiviert werden
nnoremap <f3> :set nonumber <bar> set norelativenumber<CR>
nnoremap <f4> :set number <bar> set relativenumber<CR>
"Mit F2 kann der Dateiexplorer geoffnet werden
nnoremap <f2> :Vex<CR>

nnoremap tf :tabfirst<CR>
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap te :tabedit
nnoremap tc :tabnew<CR>
nnoremap tl :tablast<CR>
nnoremap tm  :tabm<Space>
nnoremap td :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
"Es kann mit ctrl t immer ein neuer Tab aufgemacht werden
inoremap <C-t>     <Esc>:tabnew<CR>

" Syntax für Ansible

"autocmd BufNewFile,BufRead *.yml   set syntax=ansible
"autocmd BufNewFile,BufRead *.yaml   set syntax=ansible

au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible

"Code Snippets
nnoremap ,play :-1read $HOME/.vim/.skeleton.playbook.yaml<CR>2jfwa

set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline=%l    " Current line
set statusline+=/    " Separator
set statusline+=%L   " Total lines
set statusline=Current:\ %-4l\ Total:\ %-4L
set statusline+=%=        " Switch to the right side

" Farbenenstellungen
set term=xterm
set termencoding=utf8
set t_Co=256

" Dateiexplorer Einstellungen:
"Entfernt den Banner
let g:netrw_banner = 0
"oeffnet dateien in neuem Tab
let g:netrw_browse_split = 3
" Groesse Des Dateiexplorers
let g:netrw_winsize = 15
" Baummenue im Explorer
let g:netrw_liststyle= 3
"Doku https://shapeshed.com/vim-netrw/
" Netrw immer offen
"augroup ProjectDrawer
"          autocmd!
"            autocmd VimEnter,TabNew * :Vexplore
"augroup END
"zeigt punkte fuer alle spaces - nuetzlich fuer yaml Dateien
set listchars+=space:·

" Finding Files:
" Search Down into Subfolders
" Provides Tab Completion for all file related Tasks
set path+=**
