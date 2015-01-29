if exists('g:loaded_ctrlp_reference') && g:loaded_ctrlp_reference || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_reference = 1

let g:ctrlp_reference_readonly_enabled = 1

let g:ctrlp_reference_open_extensions = ['html', 'pdf']

let s:open_command = ''
if has('unix')
    let s:open_command = 'xdg-open'
endif

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
    if s:check_extension(a:str)
        call system(s:open_command.' '.a:str)
        call ctrlp#exit()
    el
        if g:ctrlp_reference_readonly_enabled
            aug ctrlp-reference
                au!
                au BufEnter *
                    \ setlocal readonly |
                    \ setlocal nomodifiable |
                    \ setlocal nobuflisted |
                    \ setlocal bufhidden=delete
            aug END
        endif
        call call('ctrlp#acceptfile', [a:mode, a:str])
        if exists("#ctrlp-reference")
            au! ctrlp-reference
        endif
    endif
endf

fu! s:check_extension(fname)
    for extension in g:ctrlp_reference_open_extensions
        if a:fname =~ '.\?\.'.extension
            retu 1
        endif
    endfor
    retu 0
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#reference#id()
    return s:id
endfunction
