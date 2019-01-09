" github.com/skylerlee/vim-infra/autoload/infra/iter.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

function infra#iter#list(list, fn) abort
  for item in a:list
    call a:fn(item)
  endfor
endfunction

function infra#iter#dict(dict, fn) abort
  for item in items(a:dict)
    call a:fn(item[0], item[1])
  endfor
endfunction
