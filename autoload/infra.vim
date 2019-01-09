" github.com/skylerlee/vim-infra/autoload/infra.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

if !exists('g:infra_root')
  let g:infra_root = expand('$HOME')
endif

function infra#require(path) abort
  let target = infra#path#join(g:infra_root, a:path)
  execute 'source ' . target
endfunction

function infra#load_json(path) abort
  let target = infra#path#join(g:infra_root, a:path)
  let buffer = join(readfile(target))
  return json_decode(buffer)
endfunction
