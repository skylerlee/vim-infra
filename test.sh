#!/usr/bin/env bash
vim -esu test/vimrc -c '+Vader! test/**/*.vader -q'
