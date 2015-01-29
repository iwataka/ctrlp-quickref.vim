if exists('g:loaded_ctrlp_quickref') && g:loaded_ctrlp_quickref || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_quickref = 1

let g:ctrlp_quickref_last_dir = ''

fu! s:read_local_config()
    if filereadable(expand('~/.ctrlp-quickref'))
        let l:content = system('cat ~/.ctrlp-quickref')
        let l:lines = split(l:content, "\n")
        let l:paths = []
        for line in l:lines
            if line !~ '^#' && line != ''
                let l:path = split(expand(line), '\n')
                let l:paths += l:path
            endif
        endfor
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
    let g:ctrlp_quickref_last_dir = a:str
    silent! exe 'normal! :CtrlPReference ' . a:str . "\<cr>"
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#quickref#id()
    return s:id
endfunction
