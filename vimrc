" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012


" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================

set encoding=utf-8
set laststatus=2
set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" insert blank lines without going into insert mode
nmap t o<Esc>k
nmap T O<Esc>j

" ex mode commands made easy
nnoremap ; :

" run python code from vim
"map <F5> :w <CR>:!python % <CR>
"map <F6> :w <CR>:!py -2 % <CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"noremap <C-n> :nohl<CR>
"vnoremap <C-n> :nohl<CR>
"inoremap <C-n> :nohl<CR>


" Quicksave command
"noremap <C-Z> :update<CR>
"vnoremap <C-Z> <C-C>:update<CR>
"inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nmap <Space> <C-w>w
nmap <S-Space> <C-w>W


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
set t_Co=256
set background=dark
"colorscheme ir_black
colorscheme solarized

" Enable syntax highlighting
" You need to reload this file for the change to apply
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
"highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700
set autoread


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

autocmd BufEnter * silent! lcd %:p:h


set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
set nocompatible


"Vundle configuration
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle handles itself
Bundle 'gmarik/vundle'

" My bundles
Bundle 'klen/python-mode'
Bundle 'bling/vim-airline'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
"Bundle 'nvie/vim-flake8'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'davidhalter/jedi-vim'


" Airline configuration
let g:airline_powerline_fonts = 1
function! AirlineInit()
    let g:airline_section_a =airline#section#create(['mode',' ','branch'])
    let g:airline_section_b =airline#section#create_left(['ffenc','hunks','%f'])
    let g:airline_section_c =airline#section#create(['filetype'])
    let g:airline_section_x =airline#section#create(['%P'])
    let g:airline_section_y =airline#section#create(['%B'])
    let g:airline_section_z =airline#section#create_right(['%l','%c'])
    let g:bufferline_echo = 0
endfunction
autocmd VimEnter * call AirlineInit()

noremap <Leader><Leader> <C-^>
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_version = 'python3'
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
let g:pymode_rope_completion = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 0


map <C-n> :NERDTreeToggle<CR>
"au GUIEnter * simalt ~x
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd BufWritePost *.py call Flake8()
let NERDTreeQuitOnOpen = 1
"let g:jedi#use_splits_not_buffers="top"
filetype plugin indent on
