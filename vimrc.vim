" ------------------------------------------------------------------------------
" Bundle Support with pathogen
" ------------------------------------------------------------------------------
"  Pathogen url: https://github.com/tpope/vim-pathogen
" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
		runtime! pathogen/autoload/pathogen.vim
		silent! call pathogen#runtime_append_all_bundles()
		silent! call pathogen#helptags()
" }

set nocompatible	" Use Vim defaults (much better!)

" ------------------------------------------------------------------------------
" Encoding
" ------------------------------------------------------------------------------
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
set encoding=utf-8

" ------------------------------------------------------------------------------
" Syntax Highlighting
" ------------------------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
syntax on
if  has("gui_running")
  colorscheme sinopia
else
	set t_Co=8
	set t_Sb=[4%dm
	set t_Sf=[3%dm
	colorscheme zellner
endif

" Show syntax highlighting groups for word under cursor
" http://stackoverflow.com/questions/1467438/
" https://github.com/nelstrom/dotfiles/blob/master/vimrc
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ------------------------------------------------------------------------------
" Miscellanous
" ------------------------------------------------------------------------------

filetype plugin on " automatic activation of plugin depending on file type
filetype indent on " load indent files, to automatically do language-dependent indenting
" last line may be replaced by 'filetype plugin indent on'

set modelines=0 " to prevent security exploits

" Show mode message in white on red
set showmode
highlight ModeMsg ctermfg=White ctermbg=Red guifg=White guibg=Red

" show command information in lower right corner
set showcmd

set showfulltag
set hidden

" command line completion
set wildmenu
set wildmode=list:longest

" No beep on errors
set visualbell

" highlight the line the cursor is on
set cursorline

" Better terminal display
set ttyfast

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ------------------------------------------------------------------------------
" Scrolling
" ------------------------------------------------------------------------------

" shows some lines below/above the cursor before scrolling
set scrolloff=4

nnoremap S J
vnoremap S J
nmap J <C-D>
vmap J <C-D>
nmap K <C-U>
vmap K <C-U>

" ------------------------------------------------------------------------------
" Backups and swaps
" ------------------------------------------------------------------------------

set backup 						" backups are nice ...
set backupdir=$HOME/.vim/tmp/backup//  " but not when they clog .
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set directory=$HOME/.vim/tmp/swap// 	" Same for swap files
silent execute '!mkdir -p $HOME/.vim/tmp/swap'

" ------------------------------------------------------------------------------
" Auto change dir
" ------------------------------------------------------------------------------
if exists('+autochdir')
	set autochdir " automatically change to the edited file directory
endif

" ------------------------------------------------------------------------------
" Ruler and Status line
" ------------------------------------------------------------------------------
set ruler		" show the cursor position all the time
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %B\ %P%) 

"statusline setup
" current dir
set statusline=%{CurDir()}/\ 
set statusline+=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%*


"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*


set statusline+=%=      "left/right separator
set statusline+=[%B]\      "hex value of character
set statusline+=C%v\     "cursor column
"set statusline+=%V\     "virtual cursor column
set statusline+=L%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set laststatus=2 " always enable status line

function! CurDir()
	let homedir = $HOME
    let curdir = substitute(getcwd(), '^'.homedir, "~", "")
    return curdir
endfunction


" ------------------------------------------------------------------------------
" Store info after file is closed
" ------------------------------------------------------------------------------

" Vim session: remember commands, registers and such
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=1000		" keep 50 lines of command line history

if exists('+undofile')
	set undofile " allow undoing even after the file is closed
	set undodir=$HOME/.vim/tmp/undo//
	silent execute '!mkdir -p $HOME/.vim/tmp/undo'
endif

" Remember cursor position using views

" Store views in special folder
set viewdir=$HOME/.vimviews// 	" same for view files
silent execute '!mkdir -p $HOME/.vimviews'

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif


" ------------------------------------------------------------------------------
" Indentation with tabs
" ------------------------------------------------------------------------------
set noexpandtab " tabs are tabs
set tabstop=4 " tabs display as four spaces
set shiftwidth=4 " one tab length to shift blocks with >> or <<
set autoindent " indent at the same level of the previous line

" Switch autoindent
nmap <leader>a :set autoindent!<CR>

" ------------------------------------------------------------------------------
" Search/Replace
" ------------------------------------------------------------------------------
" smart case search
set ignorecase
set smartcase
" line global is by default
set gdefault
" incremental search
set incsearch
set showmatch
set hlsearch
" get rid of the highlighted searches
nnoremap <leader><space> :nohlsearch<cr>

" search the selected text
vmap // y/<C-R>"<CR>
vmap <D-E> y/<C-R>"<CR>

" project wide search with Ack
nmap <D-A> :Ack<space>
let g:ackprg="ack -H -i --nocolor --nogroup --column"
" ------------------------------------------------------------------------------
" Switch between delimiters with <tab>
" ------------------------------------------------------------------------------
" tab goes between delimiters
nmap <tab> %
vmap <tab> %

" < and > are considering as a matching pair
set matchpairs+=<:>

" ------------------------------------------------------------------------------
" Soft wrapping
" ------------------------------------------------------------------------------
" display line breaks
set showbreak=…\ \|
" no hard wrapping at all
set textwidth=0
" no automatic wrapping depending on window width
set wrapmargin=0

" ------------------------------------------------------------------------------
" change the leader key to ","
" let mapleader = ","

" allow to use `;` instead of `:`
" nnoremap ; :

" ------------------------------------------------------------------------------
" Show/hide invisible characters
" ------------------------------------------------------------------------------
" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>
nmap <D-I> :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
" make them non conspicuous
highlight NonText guifg=#4a4a59 ctermfg=3*
highlight SpecialKey guifg=#4a4a59 ctermfg=3*

" ------------------------------------------------------------------------------
" Toggle line numbers
" ------------------------------------------------------------------------------
nmap <leader>n :set number!<CR>
nmap <D-N> :set number!<CR>
if exists('+relativenumber')
	nmap <leader>r :set relativenumber!<CR>
	nmap <D-R> :set relativenumber!<CR>
endif

" ------------------------------------------------------------------------------
" Cursor colour and blinking
" ------------------------------------------------------------------------------
highlight Cursor guifg=white guibg=Red
highlight iCursor guifg=white guibg=Red
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver20-iCursor-blinkon600-blinkoff600
set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10


" ------------------------------------------------------------------------------
" Fonts
" ------------------------------------------------------------------------------
"set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set guifont=Menlo:h12
set linespace=2

" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" NERDTree Settings
" ------------------------------------------------------------------------------
" Hide Python and LaTeX auxiliary files
let NERDTreeIgnore=['\.pyc', 'aux', 'pdf', 'pdfsync', 'bbl']
nmap <D-\> :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
" Quickly edit the vimrc file
" ------------------------------------------------------------------------------
" to edit in a new window:
" nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<cr>
" edit in current window:
nnoremap <leader>v :e $HOME/.vim/vimrc.vim<CR>

" ------------------------------------------------------------------------------
" Split switching
" ------------------------------------------------------------------------------
map _ <C-w>w

" ------------------------------------------------------------------------------
" Comments
" ------------------------------------------------------------------------------
nmap <D-/> <plug>NERDCommenterInvert
vmap <D-/> <plug>NERDCommenterInvert

" ------------------------------------------------------------------------------
" Spelling
" ------------------------------------------------------------------------------

if has("gui_running")
	set spell
	nmap <D-'> [s
endif

" ------------------------------------------------------------------------------
" Movements
" ------------------------------------------------------------------------------
" to move to the neighbouring virtual line below
" nnoremap j gj
" nnoremap k gk

" An attempt to change the behaviour of the moving cursor after escape
" The first problem is that it does not really work right with a
" The second problem is that in Terminal mode it is less visible
" :inoremap <Esc> <Esc>`^

" Allow to move to the end of line
set virtualedit=onemore
" $ moves after the last character
nnoremap $ $l

" since <tab> is redefined, we have to save the original behaviour
nnoremap - <C-O>
nnoremap = <C-I>

" go to next/previous edited point
nmap <D-[> g;
nmap <D-]> g,

" ------------------------------------------------------------------------------
"  Tag List
" ------------------------------------------------------------------------------
"  Toggle the tag list and switch focus to it
nmap <D-Bar> :TlistToggle<CR><C-W>w

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" ------------------------------------------------------------------------------
"  Conflict Markers
" ------------------------------------------------------------------------------
" https://github.com/nvie/vimrc/
" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" shortcut to jump to next conflict marker
nnoremap <silent> <D-+> /\v^(\<\|\=\|\>){7}<CR>

" ------------------------------------------------------------------------------
"  Python
" ------------------------------------------------------------------------------
" python highlighting
let python_highlight_all=1

" ------------------------------------------------------------------------------
"  LaTeX
" ------------------------------------------------------------------------------
" No indent
let g:LatexBox_no_indent=1


