" first clear any existing autocommands:
autocmd!

if version >= 700
   set showtabline=1
endif

"set guifont=7x13bold
"set guifont=MiscFixed\ 10,\ 6x13
"set guifont=ProggyCleanTT\ 12
"set guifont=ProggyCleanTT\ 16
set guifont=Monospace\ 11

" No toolbar, menu bar, or scroll bars - clean interface
set guioptions-=T
set guioptions-=m
"set guioptions-=r


set nomousehide
"set background=dark
"hi Normal       guifg=#86d033   guibg=black

source ~/.vimrc

syn match One   /1/
syn match Two   /2/
syn match Three /3/
syn match Four  /4/
syn match Five  /5/
syn match Six   /6/
syn match Seven /7/
syn match Eight /8/
syn match Nine  /9/

syn keyword cTodo contained THUMB_TODO

hi One   guifg=#ffffff guibg=#000000 gui=bold
hi Two   guifg=#7fffff guibg=#000000 gui=bold
hi Three guifg=#ff7fff guibg=#000000 gui=bold
hi Four  guifg=#ffff7f guibg=#000000 gui=bold
hi Five  guifg=#7f7fff guibg=#000000 gui=bold
hi Six   guifg=#7fff7f guibg=#000000 gui=bold
hi Seven guifg=#ff7f7f guibg=#000000 gui=bold
hi Eight guifg=#7f7f7f guibg=#000000 gui=bold
hi Nine  guifg=#ffffff guibg=#000000

hi Search    guibg=black guifg=Yellow
hi IncSearch guibg=black guifg=Yellow
hi Cursor    guibg=white guifg=black

"autocmd GUIEnter * winpos 501 0
"autocmd GUIEnter * winsize 80 84

