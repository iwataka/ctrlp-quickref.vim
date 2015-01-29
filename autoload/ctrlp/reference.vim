if exists('g:loaded_ctrlp_reference') && g:loaded_ctrlp_reference || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_reference = 1

call add(g:ctrlp_ext_vars, {
    \ 'init': 'ctrlp#reference#init()',
    \ 'accept': 'ctrlp#reference#accept',
    \ 'type': 'path',
    \ 'sort': 0,
    \ 'specinput': 0,
    \ })

fu! ctrlp#reference#init()
    let l:files = ctrlp#files()
    " If this is not here, the word 'Indexing...' is remained.
    cal ctrlp#progress('')
    retu l:files
endf

fu! ctrlp#reference#accept(mode, str)
    aug ctrlp-reference
        au!
        au BufEnter *
            \ setlocal readonly |
            \ setlocal nomodifiable |
            \ setlocal nobuflisted |
            \ setlocal bufhidden=delete
    aug END
    call call('ctrlp#acceptfile', [a:mode, a:str])
    au! ctrlp-reference
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#reference#id()
    return s:id
endfunction
