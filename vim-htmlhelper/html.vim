" Html macros and mappings for:
" -----------------------------
"
"    *  Closing      an opening tag
"    *  Wrapping     text with tags
"    *  Increasing   the weight of header tags (<h1>...)
"    *  Formatting   text inside a pair of tags
"    *  Rearranging  <tag> content </tag> vertically
"    *  Stripping    outer tags
"    * 'Spacing'     vertically the content of a pair of tags
"
" Rem: Use zR to unfold everything, then read :help folding
"
" Notes {{{1
"
" Author: Dimitar Dimitrov (mitkofr@yahoo.fr), kurkale6ka
"
" Note: Start with :se ft=html for any text where you want to use these
"       macros. The indenting will be done better
"
" Note: Install in:
"             ~/.vim/ftplugin/html.vim
"       ln -s ~/.vim/ftplugin/html.vim phtml.vim
"       ln -s ~/.vim/ftplugin/html.vim   xml.vim
"
" Note: @u, @o, \u and \o make use of
"       Tabular.vim and myTabularMaps.vim
"       http://github.com/godlygeek/tabular/tree/master
"
"       myTabularMaps.vim must at least contain these two lines:
"
"       AddTabularPipeline! html /\%(<[^<>?!]*>.\{-}\)\@<!<[^<>?!]*>/ tabular#TabularizeStrings(a:lines, '\%(<[^<>?!]*>.\{-}\)\@<!<[^<>?!]*>'  , 'l1')
"       \ | tabular#TabularizeStrings(a:lines, '<\/\a\+>\%(.\{-}<\/\a\+>\)\@!', 'l1')
"
" Note: \g, \r, \x and \m don't work on nested
"       <!-- --> and <?php  ?>
"       and can't be used while positioned on the first char in the file
"
" Note: If you must use @u, @o, @p, @d or \u, \o till the eof,
"       be 'careful' to add an empty line at the eof
" }}}1

" 1. Close an opening tag {{{1
" ----------------------------
"
"     >> : <tag> newline </tag> (write quickly a second > after the first one)
"     >/ : <tag>         </tag>
"     <? : <?php             ?>
"
" 2. Wrapping: {{{1
" -----------------
"
"         +-----------+-------------------+
"         | paragraph | WORD or selection |
" +-------+-----------+-------------------+
" | <ul>  |    @u     |        \u         |
" | <ol>  |    @o     |        \o         |
" | <p>   |    @p     |        \p         |
" | <div> |    @d     |        \d         |
" +-------+-----------+-------------------+
"
" Note: \u and \o work on fully selected lines only
"
" Note: mnemo for paragraphs and lines: wrap @ll
"
" Note: You can use a count with the \ mappings
"
"            +------+-------------------+
"            | line | WORD or selection |
" +----------+------+-------------------+
" | <td>     |  @t  |        \t         |
" | <a>      |  @a  |        \a         |
" | <span>   |  @s  |        \s         |
" | <h1>     |  @h  |        \h         |
" | <i>      |  @i  |        \i         |
" | <b>      |  @b  |        \b         |
" | <li>     |  @l  |        \l         |
" | <!-- --> |  @c  |        \c         |
" +----------+------+-------------------+
"
" 3. Set the class of a tag {{{1
" ------------------------------
"
"     :Class ul         -> <ul>                 (default)
"     :Class ul bg_blue -> <ul class='bg_blue'>
"
" Note: Try using :C or :Cl or... instead of :Class. Depending on the
"       installed plugins, a shorter or longer abbreviation might work.
"
" Note: If you don't want to write a long tag manually, you can use <tab>
"       after :Class to autocomplete your tag.
"       (put a space after :Class before hitting <tab>)
"
" 4. <hn -> <hn+1 (Use after a @h or \h) {{{1
" -------------------------------------------
"
"     @j (mnemo: j is just besides h on the keyboard)
"
" 5. gq inside a pair of tags {{{1
" --------------------------------
"
"     @g for standard tags
"     \g for <!-- --> or <?php ?>
"
" 6. Rearrange <tag> content </tag> vertically {{{1
" -------------------------------------------------
"
"     @r for standard tags
"     \r for <!-- --> or <?php ?>
"
" 7. Strip outer tags {{{1
" ------------------------
"
"     @x for standard tags
"     \x for <!-- --> or <?php ?>
"
" 8. 'Space' vertically the content of a pair of tags {{{1
" --------------------------------------------------------
"
"     @m for standard tags        (mnemo: )
"     \m for <!-- --> or <?php ?>
" }}}1

" Code {{{1

" Tag classes = '' {{{2
" ---------------------

" <ul>
if !exists("b:ul_class")
    let b:ul_class = ''
endif

" <ol>
if !exists("b:ol_class")
    let b:ol_class = ''
endif

" <p>
if !exists("b:p_class")
    let b:p_class = ''
endif

" <div>
if !exists("b:div_class")
    let b:div_class = ''
endif

" <td>
if !exists("b:td_class")
    let b:td_class = ''
endif

" <a>
if !exists("b:a_class")
    let b:a_class = " href=''"
endif

" <span>
if !exists("b:span_class")
    let b:span_class = ''
endif

" <h1>
if !exists("b:h1_class")
    let b:h1_class = ''
endif

" <i>
if !exists("b:i_class")
    let b:i_class = ''
endif

" <b>
if !exists("b:b_class")
    let b:b_class = ''
endif

" <li>
if !exists("b:li_class")
    let b:li_class = ''
endif

" Init functions: set the class to the right value {{{2
" -----------------------------------------------------
"
"  first  line: macro   for wrapping a paragraph or a line
"  second line: mapping for wrapping a WORD
"  third  line: mapping for wrapping a selection

function! Init_ul()

    let @u="dipO<ul" . b:ul_class . ">\<cr>\<cr>\<cr></ul>\<esc>kP0\<c-v>']I<li>\<esc>gv$A</li>\<esc>gv:Tabularize html\<cr>-=at']+EB"
    nnoremap <buffer> \£u ciW<ul<esc>:exe 'norm a' . b:ul_class . "> <li>   </li> </ul>\eB2hvitholp3EB"<cr>
    vnoremap <buffer> <silent> \u <c-v>^I<li><esc>gv$A</li><esc>gv:Tabularize html<cr>d']O<ul<esc>:exe 'norm a' . b:ul_class . ">\r\r\r</ul>\ekP-=at']+EB"<cr>

endfunction

function! Init_ol()

    let @o="dipO<ol" . b:ol_class . ">\<cr>\<cr>\<cr></ol>\<esc>kP0\<c-v>']I<li>\<esc>gv$A</li>\<esc>gv:Tabularize html\<cr>-=at']+EB"
    nnoremap <buffer> \£o ciW<ol<esc>:exe 'norm a' . b:ol_class . "> <li>   </li> </ol>\eB2hvitholp3EB"<cr>
    vnoremap <buffer> <silent> \o <c-v>^I<li><esc>gv$A</li><esc>gv:Tabularize html<cr>d']O<ol<esc>:exe 'norm a' . b:ol_class . ">\r\r\r</ol>\ekP-=at']+EB"<cr>

endfunction

function! Init_p()

    let @p="dipO<p" . b:p_class . ">\<cr>\<cr>\<c-r>\"\<cr></p>\<esc>=at']+EB"
    nnoremap <buffer> \£p ciW<p<esc>:exe 'norm a' . b:p_class . ">   </p>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \p c<p<esc>:exe 'norm a' . b:p_class . ">   </p>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_div()

    let @d="dipO<div" . b:div_class . ">\<cr>\<cr>\<c-r>\"\<cr></div>\<esc>=at']+EB"
    nnoremap <buffer> \£d ciW<div<esc>:exe 'norm a' . b:div_class . ">   </div>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \d c<div<esc>:exe 'norm a' . b:div_class . ">   </div>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_td()

    let @t="I<td" . b:td_class . "> \<end> </td>\<esc>+EB"
    nnoremap <buffer> \£t ciW<td<esc>:exe 'norm a' . b:td_class . ">   </td>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \t c<td<esc>:exe 'norm a' . b:td_class . ">   </td>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_a()

    let @a="I<a" . b:a_class . "> \<end> </a>\<esc>+EB"
    nnoremap <buffer> \£a ciW<a<esc>:exe 'norm a' . b:a_class . ">   </a>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \a c<a<esc>:exe 'norm a' . b:a_class . ">   </a>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_span()

    let @s="I<span" . b:span_class . "> \<end> </span>\<esc>+EB"
    nnoremap <buffer> \£s ciW<span<esc>:exe 'norm a' . b:span_class . ">   </span>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \s c<span<esc>:exe 'norm a' . b:span_class . ">   </span>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_h1()

    let @h="I<h1" . b:h1_class . "> \<end> </h1>\<esc>+EB"
    nnoremap <buffer> \£h ciW<h1<esc>:exe 'norm a' . b:h1_class . ">   </h1>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \h c<h1<esc>:exe 'norm a' . b:h1_class . ">   </h1>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_i()

    let @i="I<i" . b:i_class . "> \<end> </i>\<esc>+EB"
    nnoremap <buffer> \£i ciW<i<esc>:exe 'norm a' . b:i_class . ">   </i>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \i c<i<esc>:exe 'norm a' . b:i_class . ">   </i>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_b()

    let @b="I<b" . b:b_class . "> \<end> </b>\<esc>+EB"
    nnoremap <buffer> \£b ciW<b<esc>:exe 'norm a' . b:b_class . ">   </b>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \b c<b<esc>:exe 'norm a' . b:b_class . ">   </b>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

function! Init_li()

    let @l="I<li" . b:li_class . "> \<end> </li>\<esc>+EB"
    nnoremap <buffer> \£l ciW<li<esc>:exe 'norm a' . b:li_class . ">   </li>\evitholp2EB"<cr>
    vnoremap <buffer> <silent> \l c<li<esc>:exe 'norm a' . b:li_class . ">   </li>\evitholgpvatov:s/\\s\\+$//ge\r=atvatv"<cr>

endfunction

call Init_ul  ()
call Init_ol  ()
call Init_p   ()
call Init_div ()
call Init_td  ()
call Init_a   ()
call Init_span()
call Init_h1  ()
call Init_i   ()
call Init_b   ()
call Init_li  ()

" Set the class of a tag {{{2
" ---------------------------

function! SetClass(tag, ...)

    if 'ul' == a:tag

        if !exists("a:1")
            let b:ul_class = ''
        else
            let b:ul_class = " class='" . a:1 . "'"
        endif

        call Init_ul()

    elseif 'ol' == a:tag

        if !exists("a:1")
            let b:ol_class = ''
        else
            let b:ol_class = " class='" . a:1 . "'"
        endif

        call Init_ol()

    elseif 'p' == a:tag

        if !exists("a:1")
            let b:p_class = ''
        else
            let b:p_class = " class='" . a:1 . "'"
        endif

        call Init_p()

    elseif 'div' == a:tag

        if !exists("a:1")
            let b:div_class = ''
        else
            let b:div_class = " class='" . a:1 . "'"
        endif

        call Init_div()

    elseif 'td' == a:tag

        if !exists("a:1")
            let b:td_class = ''
        else
            let b:td_class = " class='" . a:1 . "'"
        endif

        call Init_td()

    elseif 'a' == a:tag

        if !exists("a:1")
            let b:a_class = " href=''"
        else
            let b:a_class = " href='' class='" . a:1 . "'"
        endif

        call Init_a()

    elseif 'span' == a:tag

        if !exists("a:1")
            let b:span_class = ''
        else
            let b:span_class = " class='" . a:1 . "'"
        endif

        call Init_span()

    elseif 'h1' == a:tag

        if !exists("a:1")
            let b:h1_class = ''
        else
            let b:h1_class = " class='" . a:1 . "'"
        endif

        call Init_h1()

    elseif 'i' == a:tag

        if !exists("a:1")
            let b:i_class = ''
        else
            let b:i_class = " class='" . a:1 . "'"
        endif

        call Init_i()

    elseif 'b' == a:tag

        if !exists("a:1")
            let b:b_class = ''
        else
            let b:b_class = " class='" . a:1 . "'"
        endif

        call Init_b()

    elseif 'li' == a:tag

        if !exists("a:1")
            let b:li_class = ''
        else
            let b:li_class = " class='" . a:1 . "'"
        endif

        call Init_li()

    endif

endfunction

command! -complete=customlist,HtmlTags -nargs=+ Class :call SetClass(<f-args>)

function! HtmlTags(A,L,P)

    return ['div ', 'span ', 'ul ', 'ol ', 'h1 ', 'li ', 'td ', 'a ', 'i ', 'b ', 'p ']

endfunction

" Close an opening tag {{{2
" -------------------------

" Each tag on a new line

inoremap <buffer> >> > </><esc>4hvi<ov"*yiw`>4l"*p`[3hr<cr>O

" Both tags on the same line

inoremap <buffer> >/ ></><esc>3hvi<ov"*yiw`>3l"*pcit  <left>

inoremap <buffer> <? <?php  ?><left><left><left>

" Wrap a line, a WORD or a selection with <!-- --> {{{2
" -----------------------------------------------------

let @c="I<!-- \<end> -->\<esc>+EB"
nnoremap <buffer> \£c ciW<!-- <c-r>- --><esc>EB
vnoremap <buffer> \c c<!--   --><esc>B2hvgpv?<!--<cr>:s/\s\+$//ge<cr>gv=`>:call search('->', 'e')<cr>

" Allow count for wrapping a single WORD or a selection {{{2
" ----------------------------------------------------------

nnoremap <buffer> \u @='\£u'<cr>
nnoremap <buffer> \o @='\£o'<cr>
nnoremap <buffer> \p @='\£p'<cr>
nnoremap <buffer> \d @='\£d'<cr>
nnoremap <buffer> \t @='\£t'<cr>
nnoremap <buffer> \a @='\£a'<cr>
nnoremap <buffer> \s @='\£s'<cr>
nnoremap <buffer> \h @='\£h'<cr>
nnoremap <buffer> \i @='\£i'<cr>
nnoremap <buffer> \b @='\£b'<cr>
nnoremap <buffer> \l @='\£l'<cr>
nnoremap <buffer> \c @='\£c'<cr>

" <hn -> <hn+1 {{{2
" -----------------

let @j="vatov\<c-a>gvovB."

" gq inside a pair of tags {{{2
" -----------------------------

let @g="=atvitgeowgq+e+EB"

nnoremap <buffer> \£g ?\_.\=<!--\<bar>\_.\=<\?php<cr>/-->\<bar>?><cr>v?<!--\<bar><\?php<cr>=gvwo-gq`>2+EB:noh<cr>

nnoremap <buffer> \g @='\£g'<cr>

" Rearrange <tag> content </tag> vertically {{{2
" ----------------------------------------------

let @r="cit\<cr>\<esc>:pu!\<cr>:s/\\s\\+$//ge\<cr>+=atjgqqjo\<esc>EB"

nnoremap <buffer> \£r ?\_.\=<!--\<bar>\_.\=<\?php<cr>/-->\<bar>?>/s-1<cr>v?<!--\<bar><\?php?e+1<cr>c<cr><esc>:pu!<cr>:s/\s\+$//ge<cr>?<!--\<bar><\?php<cr>v/-->\<bar>?><cr>=jgqqjo<esc>EB:noh<cr>

nnoremap <buffer> \r @='\£r'<cr>

" Strip outer tags {{{2
" ---------------------

let @x="vitdvatpgv:s/\\s\\+$//ge\<cr>gv=`>EB"

nnoremap <buffer> \£x ?\_.\=<!--\<bar>\_.\=<\?php<cr>/-->\<bar>?>/s-1<cr>v?<!--\<bar><\?php?e+1<cr>d?<!--\<bar><\?php<cr>v/-->\<bar>?>/e<cr>pgv=`>EB:noh<cr>

nnoremap <buffer> \x @='\£x'<cr>

" 'Space' content of a pair of tags {{{2
" --------------------------------------

let @m="vitgeowVc\<cr>\<esc>P-=at']+EB"

nnoremap <buffer> \£m ?\_.\=<!--\<bar>\_.\=<\?php<cr>/-->\<bar>?><cr>O<esc>+v?<!--\<bar><\?php<cr>=o<esc>`>+EB:noh<cr>

nnoremap <buffer> \m @='\£m'<cr>

" vim: se fdm=marker fmr& fenc=utf-8 cul hls ic is scs nu et sts=4 sw=4 lbr:
