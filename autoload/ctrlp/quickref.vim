if exists('g:loaded_ctrlp_quickref') && g:loaded_ctrlp_quickref || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_quickref = 1

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
    return g:ctrlp_quickref_paths
endfunction

function! ctrlp#quickref#accept(mode, str)
    call ctrlp#exit()
    silent! exe 'normal! :CtrlP ' . a:str . "\<cr>"
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#quickref#id()
    return s:id
endfunction
