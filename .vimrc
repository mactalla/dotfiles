set directory=.,$TEMP
syntax on
set fileformats=unix,dos
set bg=dark
set ignorecase
set smartcase
set autoread
set ts=4
set et
set ls=2
set ruler
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed " macOS
else
  set clipboard=unnamedplus " Linux
endif

" scroll offset - move the buffer before the cursor reaches the top/bottom.
set so=7

