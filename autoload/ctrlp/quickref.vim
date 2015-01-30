if exists('g:loaded_ctrlp_quickref') && g:loaded_ctrlp_quickref || v:version < 700 || &cp
    finish
endif
let g:loaded_ctrlp_quickref = 1

let g:ctrlp_quickref_last_dir = ''

let g:ctrlp_quickref_configuration_file = '~/.ctrlp-quickref'

fu! s:read_local_config()
    if filereadable(expand(g:ctrlp_quickref_configuration_file))
        let l:content = system('cat ~/.ctrlp-quickref')
        let l:lines = split(l:content, "\n")
        let l:exclusive_paths = []
        let l:inclusive_paths = []
        for line in l:lines
            if line =~ '^!\s\?'
                let l:tmp_paths = split(expand(substitute(line, '^!\s\?', "", "")), '\n')
                call s:add_directories(l:exclusive_paths, l:tmp_paths)
            elseif line !~ '^#' && line != ''
                let l:tmp_paths = split(expand(line), '\n')
                call s:add_directories(l:inclusive_paths, l:tmp_paths)
            endif
        endfor
        let l:paths = []
        for path in l:inclusive_paths
            if !s:contains(exclusive_paths, path)
                call add(l:paths, path)
            endif
        endfor
        retu l:paths
    el
        retu []
    endif
endf

fu! s:add_directories(list, paths)
    for path in a:paths
        if isdirectory(path)
            call add(a:list, path)
        endif
    endfor
endf

fu! s:contains(list, item)
    for i in a:list
        if i == a:item
            retu 1
        endif
    endfor
    retu 0
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
