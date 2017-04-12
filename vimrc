"""""""""""""""""""""""""
" General configuration "
"""""""""""""""""""""""""

" General config ---------------------- {{{

" be iMproved
set nocompatible
" Use 256 colors
set t_Co=16
" Always show what mode I'm currently editing in
set showmode
" Always show line numbers
set number
" Don't beep
set visualbell
" Don't beep
set noerrorbells
" No swap or backup files
set noswapfile
set nobackup
set nowb
" Detect '_' char as word delimiter
" set iskeyword-=_
" Show (partial) command in the status line
set showcmd
" set the commandheight
set cmdheight=2
" not wrapping text
set nowrap

"set background=dark
colorscheme monochrome

" Let Gstatus split vertically instead of horizontally
set diffopt+=vertical

" Pussy-ready
"set mouse=a

" Disable gitgutter by default
"autocmd VimEnter * GitGutterDisable

" }}}

" Abbr's ---------------------- {{{
abbreviate modelgen !./artisan models:generate -p app/Models -om --namespace=SmarttlyBE\\Models
" }}}


""""""""""""""""
" Autocommands "
""""""""""""""""

" Filetype recognition ---------------------- {{{

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scss set filetype=sass
autocmd BufNewFile,BufRead *.blade.php set filetype=blade

" }}}

" Vimscript ---------------------- {{{
"
augroup filetype_vim
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" PHP ---------------------- {{{
augroup filetype_php
    autocmd!
    autocmd FileType php :iabbrev pubf public function
    autocmd FileType php :iabbrev prif private function
    autocmd FileType php :iabbrev prof protected function
    autocmd FileType php :iabbrev func function
    autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

" }}}

" Markdown ---------------------- {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" TypeScrypt ---------------------- {{{
augroup filetype_typescript
    autocmd!
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END
" }}}

""""""""""
" Vundle "
""""""""""

" Config ---------------------- {{{
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on

" }}}

" Plugins ---------------------- {{{

call vundle#begin()

" Alternate colorschemes
"Plugin 'hickop/vim-hickop-colors'
"Plugin 'pbrisbin/vim-colors-off'

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
"Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'othree/html5.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

Plugin 'StanAngeloff/php.vim'
Plugin 'vim-php/vim-php-refactoring'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'jwalton512/vim-blade'

"Plugin 'joonty/vim-phpunitqf.git'

"Plugin 'joonty/vdebug.git'

Plugin 'scrooloose/syntastic'

Plugin 'mustache/vim-mustache-handlebars'
Plugin 'leafgarland/typescript-vim'


call vundle#end()

" }}}

"""""""
" TAB "
"""""""

" {{{

" Spaces instead of tabs
set expandtab
" I like 2 spaces for indenting
set shiftwidth=2
" I like 2 stops
set tabstop=2
" Always  set auto indenting on
set autoindent
" Copy the previous indentation on autoindenting
set copyindent
" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" When hitting <BS>, pretend like a tab is removed
set softtabstop=2
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" }}}


""""""""""
" Search "
""""""""""

" {{{

" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowecase
set smartcase
" Highlight a term when searching for it
set hlsearch
" Incremental search
set incsearch

" }}}


""""""""""""
" Mappings "
""""""""""""

" Leaders mappings ---------------------- {{{

let mapleader = ","
let localleader = "\\"

" Easy editing and sourcing .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Fast saves and quits
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>a :wq<cr>
nnoremap <leader>x :q!<cr>

" Remove search results
nnoremap <leader>h :nohlsearch<cr>

" Wraps the current word into single/double quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Compile and run a single (current) C source file
nnoremap <leader>c :SCCompileRun<cr>

" }}}

" Normal mode mappings ---------------------- {{{

" Turn ; into : in normal mode, for convenience
nnoremap ; :

" Make space bar more useful
nnoremap <space> viw

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Move to the begining of the current line
nnoremap H ^
" Move to the end of the current line
nnoremap L $

" Move a line below
nnoremap J ddp
" Move a line above
nnoremap K ddkkp

" Easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Insert mode mappings ---------------------- {{{

" Remove a line
inoremap <c-d> <esc>ddi
" Convert current word to uppercase
inoremap <c-u> <esc>viwUea

" Upper-caser 3000
inoremap <c-u> <esc>viwUea
" Remove a line
inoremap <c-d> <esc>ddO

" PHP namespaces
inoremap <leader>u <C-O>:call PhpInsertUse()<CR>
noremap <leader>u :call PhpInsertUse()<CR>

" }}}

" Visual mode mappings ---------------------- {{{

" Suround word with quotes
vnoremap ' b<esc>i'<esc>lea'
vnoremap " b<esc>i"<esc>lea"

" Wraps currently selected text into single/double quotes
vnoremap ' <esc>`>a'<esc>`<i'<esc>`>l
vnoremap " <esc>`>a"<esc>`<i"<esc>`>l

" }}}

" Operator-pending mappings ---------------------- {{{

" Map 'inside parens' to p
onoremap p i(
" Inside next parens
onoremap in( :<c-u>normal! f(vi(<cr>
" Inside last parens
onoremap il( :<c-u>normal! F)vi(<cr>
" Inside next brackets
onoremap in[ :<c-u>normal! f[vi[<cr>
" Inside last brackets
onoremap il[ :<c-u>normal! F]vi[<cr>
" Inside next curly brackets
onoremap in{ :<c-u>normal! f{vi{<cr>
" Inside last culy brackets
onoremap il{ :<c-u>normal! F}vi{<cr>
" Around next parens
onoremap an( :<c-u>normal! f(va(<cr>
" Around last parens
onoremap al( :<c-u>normal! F)va(<cr>
" Around next brackets
onoremap an[ :<c-u>normal! f[va[<cr>
" Around last brackets
onoremap al[ :<c-u>normal! F]va[<cr>
" Around next curly brackets
onoremap an{ :<c-u>normal! f{va{<cr>
" Around last culy brackets
onoremap al{ :<c-u>normal! F}va{<cr>

" }}}

" Plugin-specific mappings ---------------------- {{{

" NERDTree
nnoremap <c-x> :NERDTreeToggle<cr>
" Tagbar
nnoremap <silent> <leader>z :TagbarToggle<cr>

" Run tests
"nnoremap <leader>m :Test<cr>
" PHP namespaces
inoremap <leader>u <C-O>:call PhpInsertUse()<CR>
noremap <leader>u :call PhpInsertUse()<CR>
inoremap <leader>ex <C-O>:call PhpExpandClass()<CR>
nnoremap <leader>ex :call PhpExpandClass()<CR>

" }}}


"""""""""""""""""
" Abbreviations "
"""""""""""""""""

" {{{

"abbrev amm !php artisan make:model
"abbrev amc !php artisan make:controller
"abbrev amg !php artisan make:migration
"iabbrev funciton function
"iabbrev calss class

"}}}


"""""""""
" CtrlP "
"""""""""

" {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .git
    \ --ignore vendor
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ -g ""'

"}}}


""""""""""""""""""
" EasyTags       "
""""""""""""""""""

" {{{

let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold = 1
let g:easytags_async = 1

" }}}


"""""""""""
" Airline "
"""""""""""

" {{{

let g:airline#extensions#tabline#enabled = 1

" Always show the status line
set laststatus=2
" For unicode glyphs
set encoding=utf-8
set fileencoding=utf-8
" Hide the default mode text
set noshowmode

let g:airline_theme='lucius'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" }}}


""""""""""""""""""
" Syntastic      "
""""""""""""""""""

" {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2 -n --report=csv"
" }}}


""""""""""""""""""
" PHP Refactor   "
""""""""""""""""""

" {{{
let g:php_refactor_command='php /usr/local/bin/refactor'
" }}}


"""""""""""
" Vdebug  "
"""""""""""

" {{{
let g:vdebug_options = {}
let g:vdebug_options['ide_key'] = 'netbeans-xdebug'
let g:vdebug_options['break_on_open'] = 0
" }}}


"""""""""""
" Grepper "
"""""""""""

" {{{
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction
" }}}

""""""""""""""
" TypeScript "
""""""""""""""

" {{{
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }}}
