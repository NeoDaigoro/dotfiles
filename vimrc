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
"map <Leader>n <esc>:tabprevious<CR>
"map <Leader>m <esc>:tabnext<CR>


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
"colorscheme jellybeans
"colorscheme candyman
"colorscheme herald
"colorscheme molokai
colorscheme base16-shapeshifter

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
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'
Bundle 'flazz/vim-colorschemes'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mattn/emmet-vim'
Bundle 'chriskempson/base16-vim'

" Airline configuration
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#bufferline#enabled = 1

function! AirlineInit()
    let g:airline_section_a =airline#section#create(['mode',' ','branch'])
    let g:airline_section_b =airline#section#create_left(['ffenc'])
    let g:airline_section_c =airline#section#create(['%f'])
    let g:airline_section_x =airline#section#create(["%{tagbar#currenttag('[%s] ','')}"])
    let g:airline_section_y =airline#section#create(['%P'])
    let g:airline_section_z =airline#section#create_right(['%l/%L','%c'])
"    let g:bufferline_echo = 0
endfunction

autocmd VimEnter * call AirlineInit()

noremap <Leader><Leader> <C-^>
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_version = 'python3'
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_completion_bind = '<C-Space>'
"let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_folding = 1

"NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"au GUIEnter * simalt ~x
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd BufWritePost *.py call Flake8()
filetype plugin indent on

"closetag.vim
let g:closetag_html_style = 1
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

"Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F9> :TagbarOpenAutoClose<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_visibility = 1
let g:tagbar_singleclick = 0
function! TagbarStatusFunc(current, sort, fname, ...) abort
    let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
    return colour . '[' . a:sort . '] ' . a:fname
endfunction
let g:tagbar_status_func = 'TagbarStatusFunc'
"autocmd FileType python,py nested :TagbarOpen


"emmet-vim
let g:user_emmet_install_global = 0
"let g:use_emmet_complete_tag = 1
autocmd FileType html,css EmmetInstall

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"

    else
      return "\<CR>"

    endif

  else
    return "\<CR>"

  endif

endfunction

inoremap <expr> <CR> Expander()

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
