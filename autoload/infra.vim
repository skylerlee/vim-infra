" github.com/skylerlee/vim-infra/autoload/infra.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

" ================================================================
" base functions
" ================================================================

function infra#require(path) abort
  let target = infra#path_resolve(a:path)
  execute 'source ' . target
endfunction

function infra#load_json(path) abort
  let target = infra#path_resolve(a:path)
  let buffer = join(readfile(target))
  return json_decode(buffer)
endfunction

function infra#eval(...) abort
  execute call('printf', a:000)
endfunction

" ================================================================
" path manipulating functions
" ================================================================

let s:sep = '/'

if !exists('g:infra_path_root')
  let g:infra_path_root = expand('$HOME')
endif

function infra#path_resolve(...) abort
  return call('infra#path_join', [g:infra_path_root] + a:000)
endfunction

function infra#path_join(base, ...) abort
  let path = s:trim_end(a:base, s:sep)
  for seg in a:000
    let path .= '/' . s:trim(seg, s:sep)
  endfor
  return path
endfunction

function s:trim_start(str, char)
  if a:str[0] ==# a:char
    return a:str[1:]
  endif
  return a:str
endfunction

function s:trim_end(str, char)
  if a:str[-1:] ==# a:char
    return a:str[:-2]
  endif
  return a:str
endfunction

function s:trim(str, char)
  return s:trim_end(s:trim_start(a:str, a:char), a:char)
endfunction

" ================================================================
" collection iteration functions
" ================================================================

function infra#iter_list(list, fn) abort
  for item in a:list
    call a:fn(item)
  endfor
endfunction

function infra#iter_dict(dict, fn) abort
  for item in items(a:dict)
    call a:fn(item[0], item[1])
  endfor
endfunction
