" ------------------------------------------------------------------------------
" Bundle Support with pathogen
" ------------------------------------------------------------------------------
" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
		runtime! autoload/pathogen.vim
		silent! call pathogen#runtime_append_all_bundles()
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
" Miscellanous
" ------------------------------------------------------------------------------

filetype plugin on " automatic activation of plugin depending on file type

set modelines=0 " to prevent security exploits


set showmode
set showcmd
set showfulltag
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline " highlight the line the cursor is on
set scrolloff=4 " shows some lines below/above the cursor before scrolling
set ttyfast
set backspace=indent,eol,start " allow backspacing over everything in insert mode


" last vim version only
" set relativenumber " relative line numbers
if exists('+undofile')
	set undofile " allow undoing even after the file is closed
endif

"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=1000		" keep 50 lines of command line history

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
set statusline=%t       "tail of the filename
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


" ------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" ------------------------------------------------------------------------------
" Syntax Highlighting
" ------------------------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme sinopia
" endif

" Show syntax highlighting groups for word under cursor
" Tip: http://stackoverflow.com/questions/1467438/find-out-to-which-highlight-group-a-particular-keyword-symbol-belongs-in-vim
" https://github.com/nelstrom/dotfiles/blob/master/vimrc
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ------------------------------------------------------------------------------
if &term=="xterm"
	set t_Co=8
	set t_Sb=[4%dm
	set t_Sf=[3%dm
	colorscheme zellner
endif

" ------------------------------------------------------------------------------
" Indentation with tabs
" ------------------------------------------------------------------------------
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
"set smartindent

" ------------------------------------------------------------------------------
" Search/Replace
" ------------------------------------------------------------------------------
" using very magic mode by default
nnoremap / /\v
vnoremap / /\v
" smart case search
set ignorecase
set smartcase
" line global is by default
set gdefault
" incremental search
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr> " get rid of the highlighted searches

" ------------------------------------------------------------------------------
" Switch between delimiters with <tab>
" ------------------------------------------------------------------------------
nmap <tab> %
vmap <tab> %

" ------------------------------------------------------------------------------
" Soft wrapping
" ------------------------------------------------------------------------------
:set showbreak=:\ …

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
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
" make them non conspicuous
highlight NonText guifg=#4a4a59 ctermfg=3*
highlight SpecialKey guifg=#4a4a59 ctermfg=3*

" ------------------------------------------------------------------------------
" Toggle line numbers
" ------------------------------------------------------------------------------
nmap <leader>n :set number!<CR>

" I always use q instead of :q and that confuses me, so:
" :noremap q :q<CR>
:noremap <leader>m q

" ------------------------------------------------------------------------------
" Cursor colour and blinking
" ------------------------------------------------------------------------------
highlight Cursor guifg=white guibg=Red
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" ------------------------------------------------------------------------------
" completion
imap <A-tab> <C-n>
imap <A-S-tab> <C-p>

" ------------------------------------------------------------------------------
" LaTeX
" ------------------------------------------------------------------------------
nmap <leader>t :w<CR>:!pydflatex -ps %

" ------------------------------------------------------------------------------
" Fonts
" ------------------------------------------------------------------------------
set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set linespace=2

" ------------------------------------------------------------------------------
" Autoindent?
nmap <leader>a :set autoindent!<CR>

" ------------------------------------------------------------------------------
" NERDTree Settings
" ------------------------------------------------------------------------------
" Hide python cache files (.pyc) in NERDTree
let NERDTreeIgnore=['\.pyc', 'aux', 'pdf', 'pdfsync']

" Quickly edit the vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
