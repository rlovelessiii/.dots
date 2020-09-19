" Plug-ins

call plug#begin('~/.vim/plugins')

" --- Plug-in List ---

" Color-scheme / Appearance
Plug 'dylanaraps/wal.vim'
Plug 'yggdroot/indentline'

" Git (VCSC)
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Syntax / Linting
Plug 'dense-analysis/ale'

" Code Completion
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" File Tree
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Status-line
Plug 'vim-airline/vim-airline'

" Undo History
Plug 'mbbill/undotree'

" HTML
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'

" Markdown (.md)
"Plug 'gabrielelana/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Dev Icons - Need to be loaded in last
Plug 'ryanoasis/vim-devicons'

" Plug list end
call plug#end()

" Mapleader
let mapleader=","

" --- Vim directories ---
set backupdir=~/.vim/.backup//
set directory^=~/.vim/.swp//
set undodir=~/.vim/.undo//

" --- File Handling ---
filetype plugin indent on
set undofile
set autoread
set history=999
set undolevels=999

" --- Syntax / Language ---
syntax enable
set encoding=UTF-8
set nospell spelllang=en_us
" Indents
set autoindent smartindent
set copyindent
" Tabs
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smarttab

" --- Editor Appearance ---

" Color-scheme
colorscheme wal

" Cursor
set cursorline
set scrolloff=1000
set sidescrolloff=10

" Lines
set number
set numberwidth=6
set relativenumber
set linebreak
set nowrap

" Status-line
set laststatus=2
set ruler
set showmode

" Alerts
set noerrorbells
set visualbell

" Searching
set hlsearch
set incsearch
set ignorecase smartcase
 
" Commands
set wildmenu
set wildchar=<TAB>

" GUI features
set mouse=a

" --- Plug-ins ---

" IndentLine
let g:indentLine_setColors=0
let g:indentLine_char = '▏'

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "",
    \ 'Ignored'   : '',
    \ "Unknown"   : ""
    \ }

" Emmet
let g:user_emmet_leader_key=','
