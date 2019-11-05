set number
set relativenumber
set cursorline
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
set cursorline

" Default Colors for CursorLine
" highlight  CursorLine ctermbg=Yellow ctermfg=None
highlight CursorLine cterm=NONE ctermbg=darkyellow ctermfg=white guibg=darkyellow guifg=white

set clipboard=unnamedplus

" yaml indention
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Splits and movement
set splitbelow
set splitright

" Liste an Buffern wird gezeigt und es kann direkt der gewuenschte ausgewaehlt
" werden
nnoremap gb :ls<cr>:b


" Tmux Navigator Konfigurationen

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


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
