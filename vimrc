""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

" Welcome to the XXI century
set nocompatible

" Basic stuff
set ruler
set nowrap
set showcmd
set showmode
set wildmenu
set cmdheight=2
set laststatus=2
set foldcolumn=1
set splitright splitbelow

" Coolest line numbers
"set number
"set relativenumber

" There's no sound like silence
set visualbell
set noerrorbells

" No extra garbage
set noswapfile
set nobackup

" Let vim read project-specific config files
set exrc

set statusline=%!MyStatusLine()

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

set termguicolors
set background=dark
let g:sierra_Twilight=1
colorscheme sierra

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabbin'                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

" Tabs are for losers
set expandtab

" Two spaces for a cleaner look
set shiftwidth=2 tabstop=2 softtabstop=2

" Indent like a pro
set autoindent copyindent shiftround

" Backspace like there's no tomorrow
set backspace=indent,eol,start

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Search                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

set ignorecase smartcase
set hlsearch
set incsearch

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep Search                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{

" Rg is waaay cooler than the good ol' grep
set grepprg=ag\ --vimgrep

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" WTF (What the file...?) ---------------------- {{{

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scss set filetype=sass
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" }}}

" Two-spaces haters ---------------------- {{{

autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" }}}

" Vimscript folds ---------------------- {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Nesquickfix ---------------------- {{{

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader ---------------------- {{{

let mapleader = ","
let localleader = "\\"

" Quick .vimrc hacking
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Easy saves and quits
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>a :wq<cr>
nnoremap <leader>x :q!<cr>

" Turn that highlighters off !!
nnoremap <leader>h :nohlsearch<cr>

" Wrap the word under cursor into single/double quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Run it!
nnoremap <leader>r :!clear && node %<cr>
nnoremap <leader>p :!clear && php %

" Log it!
nnoremap <leader>cl iconsole.log()<esc>ha

" }}}

" Normal ---------------------- {{{

" Life's too short
nnoremap ; :

" Down is really the next line
nnoremap j gj
nnoremap k gk

nnoremap H ^
nnoremap L $

" Splits traveler
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <c-x> :NERDTreeToggle<cr>

" Buffer thingy
nnoremap ]f :bnext<cr>
nnoremap [f :bprevious<cr>

" Quickfix buddy
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" }}}

" Insert ---------------------- {{{

" Upper-caser 3000
inoremap <c-u> <esc>viwUea

" }}}

" Visual ---------------------- {{{

" Wrap currently selected text into single/double quotes
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

Plug 'vim-scripts/L9'
Plug 'uguu-org/vim-matrix-screensaver'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': 'html,xml,javascript.jsx,handlebars,blade' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'OrangeT/vim-csharp'
Plug 'vim-vdebug/vdebug'

call plug#end()

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree ---------------------- {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|venv|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }
let NERDTreeIgnore = ['\.pyc$']

"}}}

" CtrlP ---------------------- {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|venv|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"}}}

" Emmet ---------------------- {{{

let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','

" }}}

" ALE ---------------------- {{{

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

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
  let statusline .= "%( %h%1*%m%*%r%w%)"
  " Git branch
  if exists('b:git_dir')
   let statusline .= " [%{fugitive#head(7)}] "
  endif
  " Left/right separator
  let statusline .= "%="
  " File type
  let statusline .= " %y "
  " Line & column
  let statusline .= "[%l:%c%V] "
  " File progress
  let statusline .= "%P/%L "

  return statusline
endfunction

" }}}
