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

" Load vim plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


"" Begin Shortcuts

" List buffers and switch by number
:nnoremap ,b :buffers<CR>:buffer<Space>
:nnoremap ,q :bdelete<CR>

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

function! SearchRoot()
    if $IS_VIZONE == '1'
        :cd /opt/ardome/lib/perl 
    else
        :cd  $HOME . '/source'
    endif
    :CtrlP
endfunction

":nnoremap <C-o> :call SearchRoot()<CR> 
:nnoremap <C-p> :call SearchRoot()<CR> 
:nnoremap <C-o> :CtrlPTag<CR> 

:nnoremap ,m :map<CR>

"Show a list of snippets
:nnoremap <C-i> <Plug>snipMateShow

" Delete all trailing white space

" Generate tags
:nnoremap ,tp :!ctags -R --languages=python -f $CONDA_ENV_PATH/tags $CONDA_ENV_PATH/lib/python*/site-packages/*<CR>
:nnoremap ,tw <CR><C-v>e<C-]>
:nnoremap ,tt :TagbarToggle<CR>

" QuickFix
:nnoremap ,cc :ccl<CR>
:nnoremap ,co :cope<CR>

:nnoremap ,/ :Ag<SPACE>

" End Shortcuts

 " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
 if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor\ --follow

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


nnoremap ,g :grep! 

" Open up QuickFix for grep  
autocmd QuickFixCmdPost *grep* cwindow

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_working_path_mode = '0'
let g:ctrlp_map = '<C-\>'


if $IS_VIZONE == '1'
    :nnoremap ,tl :!ctags -R --links=yes -R -f /opt/ardome/lib/perl/tags /opt/ardome/lib/perl/<CR>
    let &tags="/opt/ardome/lib/perl/tags"
    source ~/.vimrc.v1
else
    :nnoremap ,tl :!ctags -R --links=yes -R -f $HOME/source/tags $HOME/source<CR>
    let &tags=$HOME . '/source/tags'
endif
