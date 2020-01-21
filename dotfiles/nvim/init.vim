set nocompatible              " be iMproved, required
filetype off                  " required
set modeline

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' " plugin on GitHub repo
Plugin 'morhetz/gruvbox' " Different Themes for vim
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-syntastic/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ludokng/vim-odyssey'
Plugin 'bling/vim-bufferline'
Plugin 'timakro/vim-searchant'
Plugin 'tpope/vim-surround'
Plugin 'dracula/vim'
Plugin 'matveyt/vim-modest'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'takac/vim-hardtime'
Plugin 'machakann/vim-highlightedyank'
Plugin 'sickill/vim-monokai'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'pearofducks/ansible-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin welches nicht ueber vundle geladen wird
set rtp+=~/bin/fzf

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

" Learning VIM with Hardtime
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

"## Nerdtree Settings ##"

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"## Colors ##"

" Default Colors for CursorLine
" highlight  CursorLine ctermbg=Yellow ctermfg=None
" highlight CursorLine cterm=NONE ctermbg=darkyellow ctermfg=white guibg=darkyellow guifg=white
set t_Co=256
syntax on
colorscheme desert
" colorscheme odyssey
set background=dark
" set termguicolors
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

" set Listchars
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:< " could be extended by space
set list

" Suchen werden hervorgehoben + toggle ermöglicht
nmap <leader>t :noh<CR>

" Basics
set number
set relativenumber
set ruler
set ignorecase
set hidden
set autowrite
set wildchar=<Tab> wildmenu wildmode=full
set textwidth=79
set showmatch
set showcmd
set wildcharm=<C-Z>
" Substitutuin werden live ausgefuehrt http://vimcasts.org/episodes/neovim-eyecandy/
set inccommand=nosplit
nnoremap <F10> :b <C-Z>
imap <C-L> <Esc>

" Cursor Highlights:
" Enable CursorLine
"set cursorline


set clipboard=unnamedplus

" yaml indention
autocmd FileType yaml.ansible setlocal ts=2 sts=2 sw=2 expandtab
let g:polyglot_disabled = ['yaml']

" Splits and movement
" set splitbelow erstmal entfernt.
set splitright

" Liste an Buffern wird gezeigt und es kann direkt der gewuenschte ausgewaehlt
" werden
nnoremap gb :ls<cr>:b 

" Leader neu gesetzt sowie buffer next umgestellt
let mapleader = "-"
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>f :NERDTreeToggle<cr>

" Finding Files:
" Search Down into Subfolders
" Provides Tab Completion for all file related Tasks
set path+=**

" Terminal Movement

if has('nvim')
  " Terminal mode:
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
  " Escape Squences
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-l> <C-\><C-n>
endif

""""""" Plugin Controll """""""
" Tmux Navigator Konfigurationen

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" Syntastic empfohlene Einstellungen
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_yaml_ansible_checkers = ['ansible/ansible-lint', 'yaml/yamllint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

