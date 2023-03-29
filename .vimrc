set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'Vundle/Vundle.vim'

"Plugin 'fatih/vim-go'
"Plugin 'Blackrush/vim-gocode'

"call vundle#end()
call pathogen#infect()
syntax enable  
filetype plugin on  
set number  
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:neocomplete#enable_at_startup = 1


" Use all the memory needed, for maximum performance.
set maxmemtot=2000000
set maxmem=2000000
set maxmempattern=2000000

set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set cindent         " cindent
set smartindent     " smart indent
set autoindent      " always set autoindenting on
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
"set number          " show line numbers
"set ignorecase      " ignore case when searching 
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set hid				" Move between buffers without saving
colorscheme jellybeans "Set colorscheme

"set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set sm             " show matching braces, somewhat annoying...
syntax on

set mouse=n
set ttymouse=xterm2

"set smartcase       " Only if search pattern is in all lower.
set nohlsearch      " Do not highlight search pattern. Use F4 to toggle!
set wrapscan        " Wrap search at the end/begginning of file.
"set cino=g0
set cino=g0,:0         " Do not indent case: labels in switch().
set nowrap          " Do not wrap around text.
set tags=./tags,$WA/tags
set shell=bash  " Speed up external commands (avoid reading .cshrc)
set visualbell     " Don't beep, don't bother co-workers
set backup         " Keep a backup, it might be useful one day
set backupdir=~/tmp "keep a backup but hidden!
set backspace=2    " Allow backspacing over everything in insert mode
set hidden         " Allow hidden buffers (to switch buffers without saving)
set noic
"set expandtab      " Tab will insert spaces. Use CTRL-V<Tab> to insert real tab
set showmatch      " Show matching braces a la emacs
"set listchars=tab:\xbb\xb7,trail:\xb7
"set comments=sr:/*,mb:*,ex:*/
set formatoptions=tcqor
set path=.,/usr/include,$WA
set bg=light
set cc=140
"shortcuts
ab Q q
ab wQ wq
ab WQ wq
ab Wq wq
ab sl //---------------------------------------------------------------------------//
ab csl /*---------------------------------------------------------------------------*/
ab ed //-----------------------------------The End-----------------------------------//
ab tsl #---------------------------------------------------------------------------#
ab ted #-----------------------------------The End-----------------------------------#
ab cm ///////////////////////////////////////////////////////////////////////////////<CR>//<CR>///////////////////////////////////////////////////////////////////////////////

map <c-s-n> :cn<CR>
map <c-s-p> :cp<CR>
map <c-k> :tabp<CR>
map <c-j> :tabn<CR>
"cs add $WA/.cscope/cscope.out
" When multiple tags match, I want a menu instead of jumping to first match
map <c-]> g<c-]>
" Toggle of few boolean options and print value of the option
map <F2>      :set paste!<CR>:set paste?<CR>
imap <F2> <C-O>:set paste<CR>
map <F3>      :set number!<CR>:set number?<CR>
imap <F3> <C-O>:set number!<CR><C-O>:set number?<CR>
map <F4>      :set hlsearch!<CR>:set hlsearch?<CR>
imap <F4> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>
imap <F5>      :set list!<CR>:set list?<CR>
imap <F5> <C-O>:set list!<CR><C-O>:set list?<CR>
map <F6>      :r ~/.vim/copyright<CR>
map <F7>      :r ~/.vim/H<CR>
inoremap <Del> <BS>
cnoremap <Del> <BS>
nnoremap <F9>       :!p4 edit %<CR>:e<CR>
nnoremap <F11>      :!p4 diff %<CR>:e<CR>
