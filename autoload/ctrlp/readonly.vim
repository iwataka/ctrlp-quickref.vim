if exists('g:loaded_ctrlp_readonly') && g:loaded_ctrlp_readonly || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_readonly = 1

let g:ctrlp_readonly_dir = ''

call add(g:ctrlp_ext_vars, {
    \ 'init': 'ctrlp#readonly#init()',
    \ 'accept': 'ctrlp#readonly#accept',
    \ 'type': 'path',
    \ 'sort': 0,
    \ 'specinput': 0,
    \ })

fu! ctrlp#readonly#init()
    let l:files = ctrlp#files()
    " If this is not here, the word 'Indexing...' is remained.
    cal ctrlp#progress('')
    retu l:files
endf

fu! ctrlp#readonly#accept(mode, str)
    aug ctrlp-readonly
        au!
        au BufEnter *
            \ setlocal readonly |
            \ setlocal nomodifiable |
            \ setlocal nobuflisted |
            \ setlocal bufhidden=delete
    aug END
    call call('ctrlp#acceptfile', [a:mode, a:str])
    au! ctrlp-readonly
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#readonly#id()
    return s:id
endfunction
