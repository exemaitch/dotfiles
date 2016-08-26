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

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Load vim plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


"" Begin Shortcuts

" List buffers and switch by number
:nnoremap ,b :buffers<CR>:buffer<Space>

" Source the current file
:nnoremap ,; :source %<CR>

" Map the split navigation so it's easier
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-h> <C-w>h

" List current buffers and open a buffer in a vertical split pane
:nnoremap ,vb :buffers<CR>:vert sb

" Open file in new vertical split 
:nnoremap ,vs :vs<Space>

" Syntastic Check
:nnoremap ,sc :SyntasticCheck<CR>
:nnoremap ,si :SyntasticInfo<CR>
:nnoremap ,st :SyntasticToggleMode<CR>

" Shortcut for CtrlP search
:nnoremap <C-p> :CtrlP<Space>

"Show a list of snippets
:nnoremap <C-i> <Plug>snipMateShow

" Delete all trailing white space
:nnoremap ,w  :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" End Shortcuts

 " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
 if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag -f -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
     let g:ctrlp_use_caching = 0
  "
       if !exists(":Ag")
           command -nargs=+ -complete=file -bar Ag silent! grep!  <args>|cwindow|redraw!
               nnoremap \ :Ag<SPACE>
       endif
  endif


" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
