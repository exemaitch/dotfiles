" vim should act like vim not vi
set nocompatible

" display incomplete commands
set showcmd

" turn on syntax highlighting
syntax on

" Show the current row and column as the bottom of the screen
set ruler

" Line numbers
set nu

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
 set showmatch

" Split opens in right
set splitright

" Horizontal Split opens in the bottom
set splitbelow

" Make it obvious where 80 characters is
set textwidth=80

" See the directory in status line
set statusline+=%F
set laststatus=2
