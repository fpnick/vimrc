" .vimrc by Fabian Nick
" Based on the Dvorak Programmer keyboard layout!

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
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
"Plugin 'fpnick/flowhighlight'
Plugin 'majutsushi/tagbar'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'jreybert/vimagit'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'fcpg/vim-fahrenheit'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'frioux/vim-lost'

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

scriptencoding utf-8
set encoding=utf-8

" PLUGIN SETTINGS
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_fortran_compiler = 'ifort'
let g:syntastic_quiet_messages = { "regex": 'invalid preprocessing directive #hdr\|invalid preprocessing directive #end\|invalid preprocessing directive #src\|Recommended relationship\|preprocessor line\|opening the compiled module file\|Name in only-list does not exist.   [MAX_NUMBER_OF_CONTEXTS]\|Name in only-list does not exist.   [ICONTEXT]' }

" Vimagit
autocmd User VimagitEnterCommit startinsert

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
" Show hidden files
let NERDTreeShowHidden=1

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
set background=light
set cursorline
" colorscheme delek
colorscheme fahrenheit
colorscheme default
colorscheme pablo
" let g:airline_theme='delek'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
let fortran_free_source=1
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
   syntax on
endif

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Softtabs, 3 spaces
set tabstop=3
set shiftwidth=3
set expandtab

" Textwidth
set tw=80

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

" vim-commentary
autocmd FileType matlab setlocal commentstring=%\ %s

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

" Spellchecker
set spell spelllang=en_us
set spell spellfile=mywords.add

"" Remaps
" Navigation
nnoremap h h
nnoremap t j
nnoremap n k
nnoremap s l
" Undo
"nnoremap - u
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
" Save with Shift+s
nnoremap S :w<CR>
" Quit with Shift+-
nnoremap _ :q<CR>
" Latexmk
nnoremap L :Latexmk<CR>


autocmd Filetype python setlocal ts=4 sts=4 sw=4


"UltiSnips
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-g>"
let g:UltiSnipsJumpBackwardTrigger="<c-/>"
let g:snips_author="Fabian Nick"

"Latex-Box settings
let g:LatexBox_viewer="okular"
