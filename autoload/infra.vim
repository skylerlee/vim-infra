" github.com/skylerlee/vim-infra/autoload/infra.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

if !exists('g:infra_root')
  let g:infra_root = expand('$HOME')
endif

function infra#join_path(base, ...)
  let path = a:base
  for seg in a:000
    let path .= '/' . seg
  endfor
  return path
endfunction

function infra#require(path)
  let target = infra#join_path(g:infra_root, a:path)
  execute 'source ' . target
endfunction
