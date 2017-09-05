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



" Load vim plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

let mapleader = ','

" Indent Guide
"let g:indent_guides_enable_on_vim_startup = 0
":nnoremap ,ig :IndentGuidesToggle 
set listchars=tab:\|\ 
set list

"" Begin Shortcuts

" List buffers and switch by number
:nnoremap ,bb :buffers<CR>:buffer<Space>
:nnoremap ,bd :bdelete<CR>
" List current buffers and open a buffer in a vertical split pane
:nnoremap ,bv :buffers<CR>:vert sb

" Source the current file
:nnoremap ,; :source %<CR>

" Map the split navigation so it's easier
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-h> <C-w>h


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
:nnoremap <C-p> :CtrlP<CR> 
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

:nnoremap ,f :Ag<SPACE>

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


let g:ctrlp_match_window = 'results:100'

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
let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_working_path_mode = '0'
let g:ctrlp_map = '<C-\>'

nnoremap ,cdc :cd %:p:h<CR>:pwd<CR>
nnoremap ,cdh :cd $HOME<CR>:pwd<CR>
nnoremap ,cds :cd $SOURCE_HOME<CR>:pwd<CR>
nnoremap ,cdv :cd $VETTERY_HOME<CR>:pwd<CR>


if $IS_VIZONE == '1'
    :nnoremap ,tl :!ctags -R --links=yes -R -f /opt/ardome/lib/perl/tags /opt/ardome/lib/perl/<CR>
    let &tags="/opt/ardome/lib/perl/tags"
    source ~/.vimrc.v1
else
    :nnoremap ,tl :!ctags -R --links=yes -R -f $HOME/source/tags $HOME/source<CR>
    let &tags=$HOME . '/source/tags'
endif

"Ultisnips 
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"

" valloric/ListToggle
let g:lt_location_list_toggle_map = '<leader>ll'
let g:lt_quickfix_list_toggle_map = '<leader>lq'


" Nerdtree
nnoremap <Leader>nt :NERDTreeToggle<Enter>
let NERDTreeShowHidden=1

" map c-' to esc
inoremap <C-SPACE> <ESC>

let g:EditorConfig_core_mode = 'external_command'
