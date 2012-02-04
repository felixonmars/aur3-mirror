" Redesigned mapping for the Colemak layout for Vim 7.0
" 2008-04-21 Shai Coleman, http://colemak.com/ . Public domain. 
"
" * Use ":source colemak.vim" (without quotes) to load this file. Adjust path to colemak.vim if needed.
" * Add the line: "source colemak.vim" (without quotes) in your .vimrc file to automatically load this file. 
"   It is recommended to load colemak.vim after all other Vim scripts.

" recommended commands for running under Linux console
" $ export TERM=xterm    # make Backspace and Ctrl-H work correctly
" $ stty -ixon -ixoff    # make Ctrl+S and Ctrl+Q work correctly

"
" Colemak layout:                  |                 QWERTY layout:
" `12345 67890-=     Move Around:  |  (instead of)   `12345 67890-=
"  qwfpg jlUy;[]\         u        |       k          qwert yuiop[]\
"  arstd hNEIo'         n   i      |     h   l        asdfg HJKL;'
"  zxcvb km,./            e        |       j          zxcvb nm,./
" 
" (nv  )     n =Left       ,     i =Right   ,    u =Up    ,     e =Down      
" (nv  )     N =Left*5     ,     I =Right*5 ,    U =Up*5  ,     E =Down*5    
" (  ic)  <M-n>=Left       ,  <M-i>=Right   , <M-u>=Up    ,  <M-e>=Down      
" (  ic)  <M-N>=Left*5     ,  <M-I>=Right*5 , <M-U>=Up*5  ,  <M-E>=Down*5    
" (nv  )    l =Left 1 word ,     y =Right 1 word
" (nv  ) <C-l>=Left 1 WORD ,  <C-y>=Right 1 WORD
" (nv  )    L =Home        ,     Y =End                   
" (nv  )    j =PageUp      ,     h =PageDown              
" (nv  ) <C-j>=File start  ,  <C-h>=File end
" (nv  )    - =First line  ,     _ =Last line,  <count>-=Goto line #
" (nvi )         <Tab>=Escape  (also stops search highlight in normal mode)
" (   c)       <S-Tab>=Escape
" (nvi )       <S-Tab>=Tab
" (nvic)       <Space>=Space
" ( v  )     <S-Space>=Undo space
" Legend:
" S - Shift, C - Ctrl
" (c - command line, i - insert mode, n - normal mode, v - visual+select mode)
"
if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later" | echohl None | finish | endif

" incompatible scripts: matchit.vim (fix available)

" recommended settings, enabled by default
set nocompatible	" make Vim behave in a more useful way
set nostartofline	" keep cursor in the same column if possible
set whichwrap=b,s,[,],<,>,h,l " allow cursor to wrap between lines
set virtualedit=block	" allow virtual editing in Visual block mode
set lazyredraw		" don't redraw screen while executing macros/mappings
set scrolloff=1		" minimal number of screen lines to keep above and below the cursor
set incsearch		" enable incremental search
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set winaltkeys=no	" allow mapping of alt (meta) key shortcuts
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
syntax on		" enable syntax highlighting

" recommended settings, but not enabled by default
"if has("gui_running") | source $VIMRUNTIME/mswin.vim | endif

" other optional settings
"set hlsearch		" highlight search patterns
"set ignorecase		" ignore case
"set smartcase		" ignore case when the pattern contains lowercase letters only
"set showtabline=2	" always show tab page labels
"set number		" display line numbers

" Make Alt pop up the menu for all keys, mappings in use will be overridden subsequentially
noremap <silent> <M-a> :simalt a<CR>|noremap <silent> <M-b> :simalt b<CR>|noremap <silent> <M-c> :simalt c<CR>|
noremap <silent> <M-d> :simalt d<CR>|noremap <silent> <M-e> :simalt e<CR>|noremap <silent> <M-f> :simalt f<CR>|
noremap <silent> <M-g> :simalt g<CR>|noremap <silent> <M-h> :simalt h<CR>|noremap <silent> <M-i> :simalt i<CR>|
noremap <silent> <M-j> :simalt j<CR>|noremap <silent> <M-k> :simalt k<CR>|noremap <silent> <M-l> :simalt l<CR>|
noremap <silent> <M-m> :simalt m<CR>|noremap <silent> <M-n> :simalt n<CR>|noremap <silent> <M-o> :simalt o<CR>|
noremap <silent> <M-p> :simalt p<CR>|noremap <silent> <M-q> :simalt q<CR>|noremap <silent> <M-r> :simalt r<CR>|
noremap <silent> <M-s> :simalt s<CR>|noremap <silent> <M-t> :simalt t<CR>|noremap <silent> <M-u> :simalt u<CR>|
noremap <silent> <M-v> :simalt v<CR>|noremap <silent> <M-w> :simalt w<CR>|noremap <silent> <M-x> :simalt x<CR>|
noremap <silent> <M-y> :simalt y<CR>|noremap <silent> <M-z> :simalt z<CR>|

" Turbo navigation mode
" Modified to work with counts, see :help complex-repeat
nnoremap <silent> N @='5n'<CR>|xnoremap <silent> N @='5n'<CR>|onoremap N 5h|
nnoremap <silent> U @='5u'<CR>|xnoremap <silent> U @='5u'<CR>|onoremap U 5k|
nnoremap <silent> E @='5e'<CR>|xnoremap <silent> E @='5e'<CR>|onoremap E 5j|
nnoremap <silent> I @='5i'<CR>|xnoremap <silent> I @='5i'<CR>|onoremap I 5l|
inoremap <M-N> <C-o>5h|cnoremap <M-N> <Left><Left><Left><Left><Left>|
inoremap <M-U> <C-o>5k|cnoremap <M-U> <Up><Up><Up><Up><Up>|
inoremap <M-E> <C-o>5j|cnoremap <M-E> <Down><Down><Down><Down><Down>|
inoremap <M-I> <C-o>5l|cnoremap <M-I> <Right><Right><Right><Right><Right>|

" Up/down/left/right
nnoremap n h|xnoremap n h|onoremap n h|
nnoremap u k|xnoremap u k|onoremap u k|
nnoremap e j|xnoremap e j|onoremap e j|
nnoremap i l|xnoremap i l|onoremap i l|
inoremap <M-n> <Left>|cnoremap <M-n> <Left>|
inoremap <M-u> <Up>|cnoremap <M-u> <Up>|
inoremap <M-e> <Down>|cnoremap <M-e> <Down>|
inoremap <M-i> <Right>|cnoremap <M-i> <Right>|

" Home/end of line
" 0 unchanged
nnoremap L ^|xnoremap L ^|onoremap L ^|
nnoremap Y $|xnoremap Y $|onoremap Y $|
inoremap <M-L> <Home>|cnoremap <M-L> <Home>|
inoremap <M-Y> <End>|cnoremap <M-Y> <End>|

" PageUp/PageDown
nnoremap <silent> <expr> j (winheight(0)-1) . "\<C-u>"
nnoremap <silent> <expr> h (winheight(0)-1) . "\<C-d>"
xnoremap <silent> <expr> j (winheight(0)-1) . "\<C-u>"
xnoremap <silent> <expr> h (winheight(0)-1) . "\<C-d>"
inoremap <silent> <expr> <M-j> "\<C-o>" . (winheight(0)-1) . "\<C-u>"
inoremap <silent> <expr> <M-h> "\<C-o>" . (winheight(0)-1) . "\<C-d>"
nnoremap <silent> <expr> <PageUp> (winheight(0)-1) . "\<C-u>"
nnoremap <silent> <expr> <PageDown> (winheight(0)-1) . "\<C-d>"
vnoremap <silent> <expr> <PageUp> (winheight(0)-1) . "\<C-u>"
vnoremap <silent> <expr> <PageDown> (winheight(0)-1) . "\<C-d>"
vnoremap <silent> <expr> <S-PageUp> (winheight(0)-1) . "\<C-u>"
vnoremap <silent> <expr> <S-PageDown> (winheight(0)-1) . "\<C-d>"
cnoremap <M-j> <PageUp>|
cnoremap <M-h> <PageDown>|

" Half page up/down
nnoremap <silent> <expr> <C-u> (winheight(0)/2) . "\<C-u>"
nnoremap <silent> <expr> <C-e> (winheight(0)/2) . "\<C-d>"
vnoremap <silent> <expr> <C-u> (winheight(0)/2) . "\<C-u>"
vnoremap <silent> <expr> <C-e> (winheight(0)/2) . "\<C-d>"

" Jump to line
nnoremap - gg|xnoremap - gg|onoremap - gg|
nnoremap _ G|xnoremap _ G|onoremap _ G|

" Words forwards/backwards
nnoremap l b|xnoremap l b|onoremap l b|
nnoremap y w|xnoremap y w|onoremap y w|
inoremap <M-l> <C-Left>|cnoremap <M-l> <C-Left>|
inoremap <M-y> <C-Right>|cnoremap <M-y> <C-Right>|
" WORD left/right
nnoremap <C-l> B|vnoremap <C-l> B|onoremap <C-l> B|
nnoremap <C-y> W|vnoremap <C-y> W|onoremap <C-y> W|

" inneR text objects
" e.g. dip (delete inner paragraph) is now drp
onoremap r i

" End of word forwards/backwards
"nnoremap ; e|xnoremap ; e|onoremap ; e|
"nnoremap g; ge|xnoremap g; ge|onoremap g; ge|
" Folds, etc.
"nnoremap ; z|xnoremap ; z|

" Map ; to :
nnoremap ; :|xnoremap ; :|

" for virtualedit=onemore
"set virtualedit=block,onemore
"nnoremap <End> <End><Right>|
"snoremap <End> <End><Right>|
"xnoremap <End> <End><Right>|

" Cut/copy/paste
nnoremap x x|xnoremap x d|
nnoremap c y|xnoremap c y|
nnoremap v gP|xnoremap v gP|
nnoremap X dd|xnoremap X d|
nnoremap C yy|xnoremap C y|
nnoremap V p|xnoremap V p|
nnoremap <C-c> "+Y| " <C-c> with no selection copies current line to clipboard
nnoremap <C-x> "+dd| " <C-x> with no selection cuts current line to clipboard
" (GUI) Make <C-c>/<C-v> work also in command mode, but must be selected using the mouse
cnoremap <C-c> <C-y>|
cnoremap <C-Insert> <C-y>|
cnoremap <C-v> <C-r>+|
cnoremap <S-Insert> <C-r>+|

" Undo/redo
nnoremap z u|xnoremap z :<C-u>undo<CR>|
nnoremap gz U|xnoremap gz U<C-u>undo<CR>|
nnoremap Z <C-r>|xnoremap Z :<C-u>redo<CR>|
inoremap <CR> <C-g>u<CR>| " Break undo chain (Tip #1054)

" Cursor position jumplist
nnoremap ( <C-o>|
nnoremap ) <C-i>|

" Navigate help file
" Use < and > to navigate in the help file instead
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|
au FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
au FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|
nnoremap <silent> <F1> :tab help<CR>
" opens commands in a new tab
cnoreabbr <expr> h    (getcmdtype() . getcmdline() != ':h'    ? 'h'    : 'tab help')
cnoreabbr <expr> he   (getcmdtype() . getcmdline() != ':he'   ? 'he'   : 'tab help')
cnoreabbr <expr> hel  (getcmdtype() . getcmdline() != ':hel'  ? 'hel'  : 'tab help')
cnoreabbr <expr> help (getcmdtype() . getcmdline() != ':help' ? 'help' : 'tab help')
cnoreabbr <expr> e    (getcmdtype() . getcmdline() != ':e'    ? 'e'    : 'tabedit' )
cnoreabbr <expr> ed   (getcmdtype() . getcmdline() != ':ed'   ? 'ed'   : 'tabedit' )
cnoreabbr <expr> edi  (getcmdtype() . getcmdline() != ':edi'  ? 'edi'  : 'tabedit' )
cnoreabbr <expr> edit (getcmdtype() . getcmdline() != ':edit' ? 'edit' : 'tabedit' )

" (GUI) Start/end of document
nnoremap <C-S-Home> <S-Home>gg|vnoremap <C-S-Home> <S-Home>gg|inoremap <C-S-Home> <S-Home>gg|
nnoremap <C-Home> gg0|xnoremap <C-Home> gg0|snoremap <C-Home> <C-Home><Home>|inoremap <C-Home> <C-o>gg<C-o>0|
nnoremap <C-j> gg0|xnoremap <C-j> gg0|snoremap <C-j> <C-Home><Home>|
nnoremap <C-End> G$|xnoremap <C-End> G$|snoremap <C-End> <C-End><End>|inoremap <C-End> <C-o>G<C-o>$|
nnoremap <C-h> G$|xnoremap <C-h> G$|snoremap <C-h> <C-End><End>|

" (GUI) Move cursor to top/bottom of screen
nnoremap <C-PageUp> H|vnoremap <C-PageUp> H|inoremap <C-PageUp> <C-o>H|
nnoremap <C-PageDown> L|vnoremap <C-PageDown> L|inoremap <C-PageDown> <C-o>L|

" (GUI) Scroll in place
nnoremap <C-Up> <C-y>|inoremap <C-Up> <C-o><C-y>|
nnoremap <C-Down> <C-e>|inoremap <C-Down> <C-o><C-e>|

" (GUI) Live line reordering (very useful)
nnoremap <silent> <C-S-Up> :move .-2<CR>|
nnoremap <silent> <C-S-Down> :move .+1<CR>|
vnoremap <silent> <C-S-Up> :move '<-2<CR>gv|
vnoremap <silent> <C-S-Down> :move '>+1<CR>gv|
inoremap <silent> <C-S-Up> <C-o>:move .-2<CR>|
inoremap <silent> <C-S-Down> <C-o>:move .+1<CR>|

" inSert/Replace/append (T)
nnoremap s i|
nnoremap S I|
nnoremap t a|
nnoremap T A|

" Make insert/add work also in visual line mode like in visual block mode
xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")
xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")

" Change
nnoremap w c|xnoremap w c|
nnoremap W C|xnoremap W C|
nnoremap ww cc|

" Visual mode
nnoremap a v|xnoremap a v|
nnoremap A V|xnoremap A V|
nnoremap <C-a> <Esc>ggVG$|xnoremap <C-a> <Esc>ggVG$|vnoremap <C-a> <Esc>ggVG$|
nnoremap <C-b> <C-v>|
" Allow switching from visual line to visual block mode
vnoremap <silent> <expr> <C-b> (mode() =~# "[vV]" ? "\<C-v>0o$" : "")

" (GUI) Visual mode with mouse
noremap <C-LeftMouse> <LeftMouse><Esc><C-v>|
noremap <S-LeftMouse> <LeftMouse><Esc>V|
noremap <C-LeftDrag> <LeftDrag>|
" Insert literal
inoremap <C-b> <C-v>|cnoremap <C-b> <C-v>|

" Search
" f unchanged
" F unchanged
nnoremap p t|xnoremap p t|onoremap p t|
nnoremap P T|xnoremap P T|onoremap P T|
nnoremap b ;|xnoremap b ;|onoremap b ;|
nnoremap B ,|xnoremap B ,|onoremap B ,|
nnoremap k n|xnoremap k n|onoremap k n|
nnoremap K N|xnoremap K N|onoremap K N|

" (GUI) search
nnoremap <C-f> :<C-u>promptrepl<CR>|vnoremap <C-f> :<C-u>promptrepl<CR>|inoremap <C-f> <C-o>:<C-u>promptrepl<CR>
nnoremap <F3> n|vnoremap <F3> n|inoremap <F3> <C-o>n|
nnoremap <S-F3> N|vnoremap <S-F3> N|inoremap <S-F3> <C-o>N|
nnoremap <C-F3> *|vnoremap <C-F3> *|inoremap <C-F3> <C-o>*|
nnoremap <C-S-F3> #|vnoremap <C-S-F3> #|inoremap <C-S-F3> <C-o>#|
"http://xona.com/2005/08/02.html

" Redraw screen
"nnoremap <C-r> <C-l>|vnoremap <C-r> <C-l>|

" New/close/save
noremap <silent> <C-w> :<C-u>call CloseWindow()<CR>|inoremap <silent> <C-w> <C-o>:<C-u>call CloseWindow()<CR>|cnoremap <silent> <C-w> <C-c>:<C-u>call CloseWindow()<CR>|
noremap <silent> <C-t> :<C-u>tabnew<CR>|
"noremap <silent> <C-n> :<C-u>tabnew<CR>|
function! CloseWindow()
    if winheight(2) < 0 | confirm quit | else | confirm close | endif
endfunction
"nnoremap <silent> <C-s> :<C-u>update<CR>|inoremap <C-s> <C-o>:<C-u>update<CR>|

" (GUI) open
nnoremap <C-o> :<C-u>browse tabnew<CR>|vnoremap <C-o> :<C-u>browse tabnew<CR>|

" (GUI) Tabs
noremap <silent> <C-S-Tab> :<C-u>tabprev<CR>|
noremap <silent> <C-Tab> :<C-u>tabnext<CR>|

" Restore mappings
" Free mappings: ,/+/H/~

" Macros (replay the macro recorded by qq)
nnoremap Q @q|

" Duplicate line
"nnoremap Q :copy .+0<CR>|

"<C-n> <C-p>
"@

" , is reserved for your custom remapping
"

" Misc overridden keys must be prefixed with g
nnoremap gs s|xnoremap gs s|
nnoremap gX X|xnoremap gX X|
nnoremap gU U|xnoremap gU U|
nnoremap gQ Q|xnoremap gQ Q|
nnoremap gK K|xnoremap gK K|
" extra alias
nnoremap gh K|xnoremap gh K| 

" Window handling: <C-w> is now <C-r>
nnoremap <C-r> <C-w>|xnoremap <C-r> <C-w>|
" <C-r><C-r> opens a new window
nnoremap <C-r><C-r> <C-w>n|xnoremap <C-r><C-r> <C-w>n|
nnoremap <C-r>n <C-w>h|xnoremap <C-r>n <C-w>h| 
nnoremap <C-r>u <C-w>k|xnoremap <C-r>u <C-w>k| 
nnoremap <C-r>e <C-w>j|xnoremap <C-r>e <C-w>j| 
nnoremap <C-r>i <C-w>l|xnoremap <C-r>i <C-w>l| 

nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
xnoremap <silent> <S-Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv<<CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
" To minimize Tab use, you can use '<', '>' and ':set autoindent'
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

" Enter, open line
nnoremap <CR> i<CR><Esc>|
inoremap <S-CR> <CR>|
nnoremap <S-CR> O<Esc>|
nnoremap <C-CR> o<Esc>|inoremap <C-CR> <C-o>o|

" Delete/Backspace
nnoremap <C-d> "_dw|vnoremap <C-d> "_d|inoremap <C-d> <Delete>|cnoremap <C-d> <Delete>|
nnoremap <Delete> "_x|vnoremap <Delete> "_d|
nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|
nnoremap <C-Backspace> a<Left><C-W><Right><Esc>|inoremap <C-Backspace> <C-w>|cnoremap <C-Backspace> <C-w>|
nnoremap <C-Delete> "_dw|inoremap <C-Delete> <C-o>"_dw|cnoremap <C-Delete> <Delete>|
nnoremap <S-Backspace> "_d^|inoremap <S-Backspace> <Backspace>|cnoremap <S-Backspace> <Backspace>|
nnoremap <S-Delete> "_d$|inoremap <S-Delete> <Delete>|cnoremap <S-Delete> <Delete>|

" Local autocomplete
inoremap <M-?> <C-p>|
inoremap <M-/> <C-n>|

" Omni completion
inoremap <C-S-Space> <C-p>|
inoremap <expr> <C-Space> (&omnifunc == '' <bar><bar> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>")
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Tip #1386, Make Vim completion popup menu work just like in an IDE
"set completeopt=longest,menuone
"inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
"inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
