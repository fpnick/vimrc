set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
Plugin 'fpnick/flowhighlight'
Plugin 'majutsushi/tagbar'
"Plugin 'kien/rainbow_parantheses'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" PLUGIN SETTINGS
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Calendar
let g:calendar_google_calendar = 1

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>

" Toggle nerdtree with F10
map <F5> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F6> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set backupdir=~/.vimtmp
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set foldmethod=indent " fold based on indentation
set foldlevel=100     " unfold 100 levels on startup
set wildmenu      " Show Vim command completion
set relativenumber
set number
set colorcolumn=80
set ts=3
colorscheme skittles_berry

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
let fortran_free_source=1
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
   syntax on
endif

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=3
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='dark'
set t_Co=256

:set smartcase
:set ignorecase
:set noantialias

set encoding=utf-8

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" like sublime multicursor
vnoremap . :normal .<cr>

" Prevent vi from inserting newline after 80 columns
set wrap
set linebreak
set nolist  " list disables linebreak

"""""""""""""""""""""
" remap due to dvorak
"""""""""""""""""""""
" Navigation
nnoremap h h
nnoremap t j
nnoremap n k
nnoremap s l
" Undo
nnoremap - u
" Find next and previous
nnoremap e n
nnoremap E N
nnoremap z e
nnoremap Z E
" rebind z for folding
nnoremap - z
"" make ^ more easily accessible
"nnoremap @ ^
"nnoremap ^ @
" Move window relative to cursor
nnoremap -t zt
nnoremap -- zz
nnoremap -b zb
" Use Gundo
nnoremap <F7> :GundoToggle<CR>
