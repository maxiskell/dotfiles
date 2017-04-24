""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

" Welcome to the XXI century
set nocompatible

set showmode
set showcmd
set ruler
set laststatus=2
set cmdheight=2

" Coolest line numbers
set number
set relativenumber

set visualbell
set noerrorbells
set noswapfile
set nobackup
set nowrap

set wildmenu

set statusline=%!MyStatusLine()

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

set t_Co=256
set background=dark
colorscheme xoria256

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabbin'                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set copyindent
set shiftround
set softtabstop=2
set backspace=indent,eol,start

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Search                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

set ignorecase
set smartcase
set hlsearch
set incsearch

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype recognition ---------------------- {{{

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scss set filetype=sass
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" }}}

" Indentation ---------------------- {{{

autocmd FileType (python|php) setlocal shiftwidth=4 tabstop=4 softtabstop=4

" }}}

" Vimscript folds ---------------------- {{{

augroup filetype_vim
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leaders mappings ---------------------- {{{

let mapleader = ","
let localleader = "\\"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>a :wq<cr>
nnoremap <leader>x :q!<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" }}}

" Normal mode mappings ---------------------- {{{

nnoremap ; :
nnoremap <space> viw

" Down is really the next line
nnoremap j gj
nnoremap k gk

nnoremap H ^
nnoremap L $

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <c-x> :NERDTreeToggle<cr>

" }}}

" Insert mode mappings ---------------------- {{{

" Upper-caser 3000
inoremap <c-u> <esc>viwUea

" }}}

" Visual mode mappings ---------------------- {{{

" Wraps currently selected text into single/double quotes
vnoremap ' <esc>`>a'<esc>`<i'<esc>`>l
vnoremap " <esc>`>a"<esc>`<i"<esc>`>l

" Cooler indents
vnoremap < <gv
vnoremap > >gv

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

call plug#begin('~/.vim/plugged')

Plug 'L9'
Plug 'uguu-org/vim-matrix-screensaver'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': 'html,javascript.jsx,handlebars,blade' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

call plug#end()

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|venv|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MyStatusLine() {{{

function! MyStatusLine()
    let statusline = " "
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    let statusline .= "%{fugitive#statusline()}"
    " Left/right separator
    let statusline .= "%="
    " File format and type
    let statusline .= "[%{&ff}%(\/%Y%)] "
    " Line & column
    let statusline .= "[%l,%c%V] "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L "
    return statusline
endfunction

" }}}
