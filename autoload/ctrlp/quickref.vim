if exists('g:loaded_ctrlp_quickref') && g:loaded_ctrlp_quickref || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_quickref = 1

if !exists("#CtrlP")
    aug CtrlP
endif

fu! s:set_readonly()
    au! CtrlP FileType *
                \ setlocal readonly |
                \ setlocal nomodifiable |
                \ setlocal nobuflisted |
                \ setlocal bufhidden=delete |
                \ au! CtrlP
endf

fu! s:read_local_config()
    if filereadable(expand('~/.ctrlp-quickref'))
        let l:content = system('cat ~/.ctrlp-quickref')
        let l:paths = split(l:content, "\n")
        call filter(l:paths, "v:val !~ '^#'")
        echom string(l:paths)
        call filter(l:paths, "v:val != ''")
        echom string(l:paths)
        retu l:paths
    el
        retu []
    endif
endf

call add(g:ctrlp_ext_vars, {
    \ 'init': 'ctrlp#quickref#init()',
    \ 'accept': 'ctrlp#quickref#accept',
    \ 'type': 'path',
    \ 'sort': 0,
    \ 'specinput': 0,
    \ })

function! ctrlp#quickref#init()
    if !exists('g:ctrlp_quickref_paths')
        let g:ctrlp_quickref_paths = []
    endif
    let l:additional_paths = s:read_local_config()
    return g:ctrlp_quickref_paths + l:additional_paths
endfunction

function! ctrlp#quickref#accept(mode, str)
    call ctrlp#exit()
    call s:set_readonly()
    silent! exe 'normal! :CtrlP ' . a:str . "\<cr>"
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#quickref#id()
    return s:id
endfunction
