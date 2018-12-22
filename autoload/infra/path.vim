" github.com/skylerlee/vim-infra/autoload/infra/path.vim
" Copyright (C) 2018, Skyler.
" Use of this source code is governed by the MIT license that can be
" found in the LICENSE file.

function infra#path#join(base, ...)
  let path = a:base
  for seg in a:000
    let path .= '/' . seg
  endfor
  return path
endfunction
