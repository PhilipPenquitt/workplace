set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' " plugin on GitHub repo
Plugin 'morhetz/gruvbox' " Different Themes for vim
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-syntastic/syntastic'
" Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ludokng/vim-odyssey'
Plugin 'bling/vim-bufferline'
Plugin 'timakro/vim-searchant'
Plugin 'tpope/vim-surround'

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

""" Colors """

" Default Colors for CursorLine
" highlight  CursorLine ctermbg=Yellow ctermfg=None
" highlight CursorLine cterm=NONE ctermbg=darkyellow ctermfg=white guibg=darkyellow guifg=white
set t_Co=256
syntax on
colorscheme gruvbox
" colorscheme odyssey
set background=dark
" set termguicolors
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

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
nnoremap <F10> :b <C-Z>
imap <C-L> <Esc>

" Cursor Highlights:
" Enable CursorLine
"set cursorline


set clipboard=unnamedplus

" yaml indention
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Splits and movement
set splitbelow
set splitright

" Liste an Buffern wird gezeigt und es kann direkt der gewuenschte ausgewaehlt
" werden
nnoremap gb :ls<cr>:b 

" Leader neu gesetzt sowie buffer next umgestellt
let mapleader = "-"
nnoremap <leader>n :bn<cr>

" Finding Files:
" Search Down into Subfolders
" Provides Tab Completion for all file related Tasks
set path+=**

" Explorer Settings
" Open File in Current Buffer
let g:netrw_browse_split = 4

" Remove Banner from netrw
let g:netrw_banner = 0

" Size in percentage of Netrw Split
let g:netrw_winsize = 15

" Style of File Explorer
let g:netrw_liststyle = 3

""""""" Plugin Controll """""""
" Tmux Navigator Konfigurationen

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" Syntastic empfohlene Einstellungen
let g:syntastic_python_checkers = ['pep8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
