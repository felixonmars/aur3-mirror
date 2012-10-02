" ============================================================================
"    Copyright: Copyright (C) 2007,2010 Michael Hofmann
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               errormarker.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damages
"               resulting from the use of this software.
" Name Of File: errormarker.vim
"  Description: Sets markers for compile errors
"   Maintainer: Michael Hofmann (mh21 at piware dot de)
"      Version: See g:loaded_errormarker for version number.
"        Usage: Normally, this file should reside in the plugins
"               directory and be automatically sourced. If not, you must
"               manually source this file using ':source errormarker.vim'.

" === Support for automatic retrieval (Vim script 642) ==================={{{1

" GetLatestVimScripts: 1861 1 :AutoInstall: errormarker.vim

" === Initialization ====================================================={{{1

" Exit when the Vim version is too old or missing some features
if v:version < 700 || !has("signs") || !has("autocmd")
    finish
endif

" Exit quickly when the script has already been loaded or when 'compatible'
" is set.
if exists("g:loaded_errormarker") || &compatible
    finish
endif

" Version number.
let g:loaded_errormarker = "0.1.13"

let s:save_cpo = &cpo
set cpo&vim

command ErrorAtCursor call ShowErrorAtCursor()
if !hasmapto(":ErrorAtCursor<cr>", "n") &&
            \ (!exists('g:errormarker_disablemappings') || !g:errormarker_disablemappings)
    nmap <silent> <unique> <Leader>cc :ErrorAtCursor<CR>
endif

function! s:DefineVariable(name, default)
    if !exists(a:name)
        execute 'let ' . a:name . ' = "' . escape(a:default, '\"') . '"'
    endif
endfunction

" === Variables =========================================================={{{1

" Defines the icon to show for errors in the gui
call s:DefineVariable("g:errormarker_erroricon",
            \ has('win32') ? expand("~/vimfiles/icons/error.bmp") :
                \ "/usr/share/icons/gnome/16x16/status/dialog-error.png")

" Defines the icon to show for warnings in the gui
call s:DefineVariable("g:errormarker_warningicon",
            \ has('win32') ? expand("~/vimfiles/icons/warning.bmp") :
                \ "/usr/share/icons/gnome/16x16/status/dialog-warning.png")

" Defines the text (two characters) to show for errors in the gui
call s:DefineVariable("g:errormarker_errortext", "EE")

" Defines the text (two characters) to show for warnings in the gui
call s:DefineVariable("g:errormarker_warningtext", "WW")

" Defines the highlighting group to use for errors in the gui
call s:DefineVariable("g:errormarker_errorgroup", "Todo")

" Defines the highlighting group to use for warnings in the gui
call s:DefineVariable("g:errormarker_warninggroup", "Todo")

" Defines the error types that should be treated as warning
call s:DefineVariable("g:errormarker_warningtypes", "wW")

" === Global ============================================================={{{1

" Define the signs
let s:erroricon = ""
if filereadable(g:errormarker_erroricon)
    let s:erroricon = " icon=" . escape(g:errormarker_erroricon, '| \')
endif
let s:warningicon = ""
if filereadable(g:errormarker_warningicon)
    let s:warningicon = " icon=" . escape(g:errormarker_warningicon, '| \')
endif
execute "sign define errormarker_error text=" . g:errormarker_errortext .
            \ " linehl=" . g:errormarker_errorgroup . s:erroricon

execute "sign define errormarker_warning text=" . g:errormarker_warningtext .
            \ " linehl=" . g:errormarker_warninggroup . s:warningicon

" Setup the autocommands that handle the MRUList and other stuff.
augroup errormarker
    autocmd QuickFixCmdPost make call <SID>SetErrorMarkers()
augroup END

" === Functions =========================================================={{{1

function! ShowErrorAtCursor()
    let [l:bufnr, l:lnum] = getpos(".")[0:1]
    let l:bufnr = bufnr("%")
    for l:d in getqflist()
        if (l:d.bufnr != l:bufnr || l:d.lnum != l:lnum)
            continue
        endif
        redraw | echomsg l:d.text
    endfor
    echo
endfunction

function! s:SetErrorMarkers()
    if has ('balloon_eval')
        let &balloonexpr = "<SNR>" . s:SID() . "_ErrorMessageBalloons()"
        set ballooneval
    endif

    sign unplace *

    let l:positions = {}
    for l:d in getqflist()
        if (l:d.bufnr == 0 || l:d.lnum == 0)
            continue
        endif

        let l:key = l:d.bufnr . l:d.lnum
        if has_key(l:positions, l:key)
            continue
        endif
        let l:positions[l:key] = 1

        if strlen(l:d.type) &&
                    \ stridx(g:errormarker_warningtypes, l:d.type) >= 0
            let l:name = "errormarker_warning"
        else
            let l:name = "errormarker_error"
        endif
        execute ":sign place " . l:key . " line=" . l:d.lnum . " name=" .
                    \ l:name . " buffer=" . l:d.bufnr
    endfor
endfunction

function! s:ErrorMessageBalloons()
    for l:d in getqflist()
        if (d.bufnr == v:beval_bufnr && d.lnum == v:beval_lnum)
            return l:d.text
        endif
    endfor
    return ""
endfunction

function! s:SID()
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction

" === Cleanup ============================================================{{{1

let &cpo = s:save_cpo

finish

