" github.com/skylerlee/vim-infra/autoload/infra/json.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

function infra#json#decode(str) abort
  return json_decode(a:str)
endfunction

function infra#json#encode(val) abort
  return json_encode(a:val)
endfunction

" --- JSON decoding ---

function s:parse()
endfunction

" --- JSON encoding ---

function s:stringify()
endfunction
