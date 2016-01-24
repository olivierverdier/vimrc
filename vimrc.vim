" ------------------------------------------------------------------------------
" Bundle Support with pathogen
" ------------------------------------------------------------------------------
" Setup a list of plugins to disable in command mode:
let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'AsyncCommand')
endif


" ------------------------------------------------------------------------------
"  Start Pathogen
"  Pathogen url: https://github.com/tpope/vim-pathogen
" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
		runtime! pathogen/autoload/pathogen.vim
		silent! call pathogen#runtime_append_all_bundles()
		silent! call pathogen#helptags()
" }

set nocompatible	" Use Vim defaults (much better!)

" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" ------------------------------------------------------------------------------
" Encoding
" ------------------------------------------------------------------------------
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" ------------------------------------------------------------------------------
" Syntax Highlighting
" ------------------------------------------------------------------------------
" if  has("gui_running")
  " colorscheme sinopia
	" set background=dark
  colorscheme solarized
  " colorscheme base16-default
  let g:solarized_contrast='high'
  se t_Co=256
  let g:solarized_termcolors=256
" else
" 	set t_Co=8
" 	set t_Sb=[4%dm
" 	set t_Sf=[3%dm
" 	colorscheme zellner
" endif

" Show syntax highlighting groups for word under cursor
" http://stackoverflow.com/questions/1467438/
" https://github.com/nelstrom/dotfiles/blob/master/vimrc
nmap <leader>p :call <SID>SynStack()<CR>
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

set modelines=0 " to prevent security exploits

" Mode messages (superseded by powerline)
set noshowmode
highlight ModeMsg ctermfg=White ctermbg=Red guifg=White guibg=Red


set showfulltag
set hidden

" On ambiguous completion, first show a list, then cycle through it
set wildmode=list:longest,full

" No beep on errors
set visualbell

" Better terminal display
set ttyfast


" ------------------------------------------------------------------------------
" Scrolling
" ------------------------------------------------------------------------------


" nnoremap S J
" vnoremap S J
nmap <C-J> <C-D>
vmap <C-J> <C-D>
nnoremap <C-K> <C-U>
vnoremap <C-K> <C-U>
"
" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" ------------------------------------------------------------------------------
" Backups and swaps
" ------------------------------------------------------------------------------

set backup 						" backups are nice ...
set backupdir=$HOME/.vimtmp/backup//  " but not when they clog .
silent execute '!mkdir -p $HOME/.vimtmp/backup'
set directory=$HOME/.vimtmp/swap// 	" Same for swap files
silent execute '!mkdir -p $HOME/.vimtmp/swap'

" ------------------------------------------------------------------------------
" Auto change dir
" ------------------------------------------------------------------------------
if exists('+autochdir')
	set autochdir " automatically change to the edited file directory
endif

" ------------------------------------------------------------------------------
" Ruler and Status line
" ------------------------------------------------------------------------------
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

" Note: the last settings are lost when using powerline

" Normal mode:
" let g:Powerline_mode_n = 'N'




function! CurDir()
	let homedir = $HOME
    let curdir = substitute(getcwd(), '^'.homedir, "~", "")
    return curdir
endfunction

let g:airline#extensions#whitespace#checks = []
" let g:airline#extensions#tabline#enabled = 1

" ------------------------------------------------------------------------------
" Store info after file is closed
" ------------------------------------------------------------------------------

" Vim session: remember commands, registers and such
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers

if exists('+undofile')
	set undofile " allow undoing even after the file is closed
	set undodir=$HOME/.vimtmp/undo//
	silent execute '!mkdir -p $HOME/.vimtmp/undo'
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
" Copy in global register
" ------------------------------------------------------------------------------

set clipboard=unnamed

" ------------------------------------------------------------------------------
" Indentation with tabs
" ------------------------------------------------------------------------------
set noexpandtab " tabs are tabs
set tabstop=4 " tabs display as four spaces
set shiftwidth=4 " one tab length to shift blocks with >> or <<
set autoindent " indent at the same level of the previous line

" Switch autoindent
nmap <leader>a :set autoindent!<CR>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" ------------------------------------------------------------------------------
" Search/Replace
" ------------------------------------------------------------------------------
" smart case search
set ignorecase
set smartcase
" line global is by default
set gdefault
set showmatch
set hlsearch

" nnoremap <BS> :set hlsearch! hlsearch?<cr>

" search the selected text
vmap // y/<C-R>"<CR>

" remap backward search
noremap # #//<CR>``

" project wide search with Ack
nmap <D-A> :Ack<space>
let g:ackprg="ack -H -i --nocolor --nogroup --column"

" Alias for searching
map <space> /

" ------------------------------------------------------------------------------
" Switch between delimiters with <tab>
" ------------------------------------------------------------------------------
" tab goes between delimiters
nmap <tab> %
vmap <tab> %

" < and > are considering as a matching pair
" set matchpairs+=<:>

" ------------------------------------------------------------------------------
" Soft wrapping
" ------------------------------------------------------------------------------
" display line breaks
set showbreak=>\ 
" let &showbreak = '↳ '
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
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
" make them non conspicuous
highlight SpecialKey guifg=#4a4a59 ctermfg=3*

" ------------------------------------------------------------------------------
" Toggle line numbers
" ------------------------------------------------------------------------------

set nu
set rnu

" ------------------------------------------------------------------------------
" Cursor colour and blinking
" ------------------------------------------------------------------------------
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i-ci:ver20-iCursor-blinkon600-blinkoff600
set guicursor=n-v-c:blinkon0
"
" highlight the line the cursor is on
set cursorline


" ------------------------------------------------------------------------------
" Fonts
" ------------------------------------------------------------------------------
"set guifont=Bitstream\ Vera\ Sans\ Mono:h12
" set guifont=Menlo:h17
set guifont=Hack:h17
" set guifont=Source\ Code\ Pro:h13
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
nnoremap <leader>, :e $HOME/.vim/vimrc.vim<CR>
" To reload the vimrc file:
" :source $VIMRC<cr>

" ------------------------------------------------------------------------------
" Window Move
" ------------------------------------------------------------------------------
"  Go to the next window
nmap ! <C-w>w

" ------------------------------------------------------------------------------
" Alternate Buffer Switch
" ------------------------------------------------------------------------------
nmap _ <C-^>g`"


" ------------------------------------------------------------------------------
" Comments
" ------------------------------------------------------------------------------
nnoremap <D-/> :TComment<cr>
vnoremap <D-/> :TComment<cr>

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
" set virtualedit=onemore
" $ moves after the last character
nnoremap $ $l

" since <tab> is redefined, we have to save the original behaviour
nnoremap <D-[> <C-O>
nnoremap <D-]> <C-I>

" go to next/previous edited point
nmap - g;
nmap = g,

" ------------------------------------------------------------------------------
"  Tag List
" ------------------------------------------------------------------------------
"  Toggle the tag list and switch focus to it
nmap <D-Bar> :TagbarToggle<CR><C-W>w

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
	set guioptions-=T
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


" ------------------------------------------------------------------------------
"  Gundo/undotree
" ------------------------------------------------------------------------------
noremap <silent> <leader>u :UndotreeToggle<cr>

" ------------------------------------------------------------------------------
" Pylint-mode
" ------------------------------------------------------------------------------

let g:PyLintDissabledMessages = 'W0312,C0103,C0111,C0202,W0404,R0912,R0914,C0302,R0903,C0301,W0704,W0201,E1101,E1103,W0402,W0142'
" C0202: Class method should have "cls" as first argument
" W0201: Attribute %r defined outside __init__ 
" W0704: Except doesn't do anything 
" E1101,E1103: %s %r has no %r member 
let g:PyLintCWindow = 1

" ------------------------------------------------------------------------------
" Quickfix
" ------------------------------------------------------------------------------

" Code from http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window

" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

let g:jah_Quickfix_Win_Height = 10

" toggle the Quickfix window
nmap <silent><D-e> :QFix<cr>
nmap <silent> <leader>e :QFix<cr>


" ------------------------------------------------------------------------------
" Autoclose
" ------------------------------------------------------------------------------
" Disable autoclosing of < >
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '`': '`', '«': '»'}


" ------------------------------------------------------------------------------
" Pydiction
" ------------------------------------------------------------------------------
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" ------------------------------------------------------------------------------
" LaTeX format by default
" ------------------------------------------------------------------------------
let g:tex_flavor = "latex"

" ------------------------------------------------------------------------------
" Control-P
" ------------------------------------------------------------------------------
" nmap <silent><leader>b :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlPBuffer'

" ------------------------------------------------------------------------------
" Quickfixsigns
" ------------------------------------------------------------------------------
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints',]
" ------------------------------------------------------------------------------
" vim2hs
" ------------------------------------------------------------------------------
let g:haskell_conceal_wide = 1

" ------------------------------------------------------------------------------
" ghc-mod
" ------------------------------------------------------------------------------

nmap <leader>ht :GhcModType<CR>
nmap <leader>hc :GhcModTypeClear<CR>

