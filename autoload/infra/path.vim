" github.com/skylerlee/vim-infra/autoload/infra/path.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

let s:sep = '/'

function infra#path#join(base, ...)
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
