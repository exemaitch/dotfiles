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
:nnoremap ,be :BufExplorer<CR>
:nnoremap ,bt :ToggleBufExplorer<CR>
:nnoremap ,bh :BufExplorerHorizontalSplit<CR>
:nnoremap ,bs :BufExplorerVerticalSplit<CR>
:nnoremap ,bo <C-w>o
let g:bufExplorerDisableDefaultKeyMapping=1  

" Source the current file
:nnoremap ,; :source %<CR>

" Map the split navigation so it's easier
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
:nnoremap <C-h> <C-w>h


" Open file in new vertical split
:nnoremap ,vs :vs<Space>

" Syntastic Check
:nnoremap ,sc :SyntasticCheck<CR>
:nnoremap ,si :SyntasticInfo<CR>
:nnoremap ,st :SyntasticToggleMode<CR>

" Shortcut for CtrlP search

:nnoremap <C-p> :CtrlP<CR> 
:nnoremap <C-o> :CtrlPTag<CR> 
:nnoremap <C-b> :CtrlPBuffer<CR> 
:nnoremap <C-m> :CtrlPMRUFiles<CR> 
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_reuse_window = 'netrw'

:nnoremap ,m :map<CR>

"Show a list of snippets
:nnoremap <C-i> <Plug>snipMateShow

" Delete all trailing white space

" Generate tags
:nnoremap ,tt :TagbarToggle<CR>

" QuickFix
:nnoremap ,cc :ccl<CR>
:nnoremap ,co :cope<CR>


" End Shortcuts

 " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
 if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor\ --follow
   let g:ackprg = 'ag --vimgrep'

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag -f -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
     let g:ctrlp_use_caching = 0
  "
  endif


let g:ctrlp_match_window = 'results:50'

nnoremap ,g :grep! 

" Open up QuickFix for grep  
autocmd QuickFixCmdPost *grep* cwindow

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']

let g:ctrlp_working_path_mode = '0'

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
nnoremap <Leader>nc :NERDTreeClose<Enter>
let NERDTreeShowHidden=1

" map c-' to esc
inoremap <C-SPACE> <ESC>

let g:EditorConfig_core_mode = 'external_command'


" SideSearch 
let g:side_search_prg = 'ag --word-regexp'
  \. " --hidden"
  \. " --heading --stats -B 1 -A 4"
let g:side_search_splitter = 'vnew'
nnoremap <c-f> :SideSearch<Space>
nnoremap <c-e> yw:SideSearch <c-r><c-w>
inoremap <c-w> <esc>:w<cr>                 " save files
nnoremap <c-w> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>
"Bookmarks
let g:bookmark_no_default_key_mappings = 1
nnoremap <Leader>wt <Plug>BookmarkToggle
nnoremap <Leader>wi <Plug>BookmarkAnnotate
nnoremap <Leader>wa <Plug>BookmarkShowAll
nnoremap <Leader>wj <Plug>BookmarkNext
nnoremap <Leader>wk <Plug>BookmarkPrev
nnoremap <Leader>wc <Plug>BookmarkClear
nnoremap <Leader>wx <Plug>BookmarkClearAll
nnoremap <Leader>wkk <Plug>BookmarkMoveUp
nnoremap <Leader>wjj <Plug>BookmarkMoveDown
nnoremap <Leader>wg <Plug>BookmarkMoveToLine
"" Avoid keybinding conflicts with NerdTree
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" Highlight Search
nnoremap ,h :set hls!<CR>
