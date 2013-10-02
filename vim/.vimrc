" first clear any existing autocommands:
autocmd!

set ff=unix
"set autochdir
set nocompatible

set autowrite
set hidden

set history=50
set viminfo=/10,'20,r/tmp,f0,\"100

set wildmode=list,full
"set wildmenu
set wildignore=.c.basis,.c.edited,.c.link,.c.orig,.class

" have syntax highlighting in terminals which can display colors:
syntax on

set virtualedit=block
set shortmess+=Ir
set showcmd
set showmode
"set cursorline

" when using list, keep tabs at their full width and display `arrows':
set listchars+=tab:>-

set mouse=a

" don't have files trying to override this .vimrc:
"set nomodeline

set wrap

set noequalalways
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set smartindent

set colorcolumn=80

set tabstop=8
set softtabstop=4

set comments=sr:/*,mb:*,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

set cinkeys=0{,0},:,0#,!^F,o,O,e,;
set cinoptions=l1,t0,(0,u0,U1,Ws,j1,=s
"set cinoptions=>s,e0,n0,f0,{0,^0,:s,=0,ps,ts,+s,(0,)20,*30
set suffixes=.bak,~,.o,.info,.swp,.obj

set noerrorbells
set visualbell
set ruler
set rulerformat=%25([%{&fileformat}]%14(%l,%c%V%)%=%4P%)
set laststatus=2

set path=.
set path+=/usr/include/**
set path+=,,

"set scrolloff=2

" * Search & Replace

" Automatic & persistent highlighting options
" show the `best match so far' as search strings are typed:
set hlsearch
set incsearch

" have ,l ("toggle list") toggle list on/off and report the change:
nnoremap ,l :set invlist list?<CR>

" have ,, and ,h ("toggle highlight") toggle highlighting of search matches,
" and report the change: (remove ,, after you get used to ,h)
nnoremap ,h :set invhls hls?<CR>

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Don't open a file with fold-marker type folds closed
"set foldlevelstart=10

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" save the current session as Session.vim
nnoremap ,s :mksession!<CR>
nnoremap ,S :source Session.vim<CR>

if expand($MACHTYPE) == "i386"
    set shell=/bin/bash
endif

vnoremap zc zf

"nnoremap :q<CR> :bd<CR>
"nnoremap :Q<CR> :bd<CR>
nnoremap :W<CR> :w<CR>
nnoremap :Wq<CR> :wq<CR>
nnoremap :Wqa<CR> :wqa<CR>
nnoremap ,b :buffers<CR>
nnoremap ,m :up<CR>:make<CR>
nnoremap ,W :winsize 161 63<CR>
nnoremap ,w :winsize 80 63<CR>
nnoremap ,g :call GrepSearch()<CR>

nnoremap <S-F1>  :source ~/.vimrc<CR>
nnoremap <S-F2>  :source ~/.gvimrc<CR>

nmap     <F2>    :up<CR>
nmap     <F3>    :up<CR>:bd<CR>
nnoremap :bd<CR> :up<CR>:bd<CR>
nnoremap :Bd<CR> :up<CR>:bd<CR>

nnoremap <M-F4>  :wqa!<CR>

nnoremap <S-F5> :VSTreeExplore<CR>

nnoremap <F6>   :diffu<CR>
nnoremap <S-F6> :diffthis<CR>
nnoremap <C-F6> :se nodiff<CR>:se foldcolumn=0<CR>

" close, split, vsplit windows
nnoremap <F7>    :wincmd c<CR>
nnoremap <F8>    :wincmd s<CR>
nnoremap <F9>    :wincmd v<CR>

" C-Error handling
nnoremap ,c     :cope 20<cr>
nnoremap ,C     :cc<cr>
nnoremap ,n     :cn<CR>
nnoremap <F4>   :cn<CR>
nnoremap <F5>   :cp<CR>
nnoremap ,N     :cnf<CR>
nnoremap <S-F4> :cnf<CR>
nnoremap ,p     :cp<cr>

" tab navigation like firefox
"nmap     <C-S-tab> :tabprevious<cr>
"nmap     <C-tab>   :tabnext<cr>
"map      <C-S-tab> :tabprevious<cr>
"map      <C-tab>   :tabnext<cr>
"nmap     <C-t>     :tabnew<cr>
"imap     <C-S-tab> <ESC>:tabprevious<cr>i
"imap     <C-tab>   <ESC>:tabnext<cr>i
"imap     <C-t>     <ESC>:tabnew<cr>

" enable filetype detection:
filetype on
filetype plugin on

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  au!
  au BufNewFile,BufRead Makefile set syntax=make softtabstop=8 noet
  au BufNewFile,BufRead *.mak set syntax=make softtabstop=8 noet
  au BufNewFile,BufRead Imakefile set syntax=imake softtabstop=8 noet
  au BufNewFile,BufRead Imake.* set syntax=imake softtabstop=8 noet
  au BufNewFile,BufRead Imakefile.* set syntax=imake softtabstop=8 noet
  au BufNewFile,BufRead *.targetname set syntax=imake softtabstop=8 noet
  au BufNewFile,BufRead *.Imakefile set syntax=imake softtabstop=8 noet
  au BufNewFile,BufRead *.kernel set syntax=perl softtabstop=8 noet
  au BufNewFile,BufRead *.target set syntax=make softtabstop=8 noet
  au BufNewFile,BufRead *.prj set syntax=make softtabstop=8 noet
  au BufNewFile,BufRead *.bb set syntax=lxkbb
augroup END

augroup filetypedetect
  au BufNewFile,BufRead *.txt setf text
augroup END

" in human-language files, automatically format everything at 72 chars:
"autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType h set cindent textwidth=80 filetype=c
autocmd FileType c,cpp,slang set cindent textwidth=80

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" Automatically add a close brace when typing an open brace
" autocmd FileType c,cpp iabbrev { {<CR>}<UP>

" Automatically give me a main framework when I type main (
"autocmd FileType c,cpp iabbrev main main (int argc, char **argv)<CR>{<CR>return 0;<CR>}<UP><UP>

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" Don't load the Highlighting matching parens plugin, it's annoying with my
" preferred color scheme
if version >= 700
let loaded_matchparen = 1
endif

" * Spelling

" correct my common typos without me even noticing them:
iabbrev teh the
iabbrev rebuld rebuild
iabbrev rebulid rebuild
iabbrev nop <nop>

" * Keystrokes -- Moving Around

" have ~ convert case over line breaks; also have the cursor keys wrap
set whichwrap=b,s,~,<,[,],>

" page down with +
" page up with -
" nnoremap + <PageDown>
" nnoremap - <PageUp>

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bNext<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.


" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" * Syntax Highlighting and Colors
syntax on
syn keyword cConstant TRUE FALSE __FUNCTION__
syn match cType /\<\D[a-zA-z0-9_]*\(_[te]\|_PARMS\|_\?type\|_enum\|FUNC\|_rgb\)\>/

let psc_cterm_style='cool'
let psc_style='cool'
"let psc_style='warm'
"let psc_style='default'
"let psc_style='defdark'
"colorscheme ps_color
"colorscheme blackbeauty
"colorscheme asu1dark
"colorscheme molokai
"colorscheme paintbox
"colorscheme sift
"colorscheme slate2
colorscheme wood

if !exists("my_autocommands")
let my_autocommands=1
au BufNewFile,BufRead *.shr
	\ if exists("c_syntax_for_h") | setf c | else | setf cpp | endif

au BufNewFile,BufRead *.prv
	\ if exists("c_syntax_for_h") | setf c | else | setf cpp | endif
endif

let g:GITCommandDeleteOnHide=1

