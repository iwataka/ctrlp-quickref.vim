if exists('g:loaded_ctrlp_quickref') && g:loaded_ctrlp_quickref || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_quickref = 1

fu! s:read_local_config()
    if filereadable(expand('~/.ctrlp-quickref'))
        let l:content = system('cat ~/.ctrlp-quickref')
        let l:paths = split(l:content, "\n")
        call filter(l:paths, "v:val !~ '^#'")
        call filter(l:paths, "v:val != ''")
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
    silent! exe 'normal! :CtrlPReadOnly ' . a:str . "\<cr>"
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#quickref#id()
    return s:id
endfunction
