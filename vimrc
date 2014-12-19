"""""""""""""""""""""""""""""""""""""""
"JameyC's .vimrc
"
"  Use with caution, or better yet,
"  don't use at all. Write your own,
"  you lazy sod.
"""""""""""""""""""""""""""""""""""""""


" NEOBUNDLE STUFF - TODO
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  " Get neobundle up and running
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Check if make is gmake, or gmake is gmake (I'm looking at you, BSD...)
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
        let g:make = 'make'
endif

" Init neobundle's bundles
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundle time
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'spiiph/vim-space.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'vim-scripts/matchit.zip.git'
NeoBundle 'wookiehangover/jshint.vim.git'
NeoBundle 'Shougo/vimfiler.vim.git'
NeoBundle 'vim-scripts/operator-html-escape.git', {'depends' : 'kana/vim-operator-user.git' }
NeoBundle 't9md/vim-choosewin.git'

" vcs stuff
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'airblade/vim-gitgutter.git'

" use symbols
NeoBundle 'ehamberg/vim-cute-python.git'
NeoBundle 'jameyc/js-mask.git'
NeoBundle 'laurentb/vim-cute-php.git'
NeoBundle 'bling/vim-airline.git'

NeoBundle 'Shougo/neocomplete.vim.git'
NeoBundle 'Shougo/neosnippet.vim.git'

NeoBundle 'gorodinskiy/vim-coloresque.git'

NeoBundle 'oblitum/rainbow.git'

"NeoBundle '/thisivan/vim-bufexplorer.git'
"NeoBundle '/scrooloose/nerdtree.git'
"
"" visually show marks. Do I really use it?
"NeoBundle '/jacquesbh/vim-showmarks.git'
"
"a tab stuff.
"NeoBundle '/tomtom/tlib_vim.git'
"NeoBundle '/ervandew/supertab.git'
"
"NeoBundle '/milkypostman/vim-togglelist.git'
"NeoBundle '/kien/rainbow_parentheses.vim.git'
"NeoBundle '/int3/vim-taglist-plus'
"NeoBundle '/dart-vim-plugin.git'
"
"NeoBundle '/vim-pyref.git'
"NeoBundle '/vim-misc.git'
"
call neobundle#end()

" Neobundle needs this early on...
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set nocompatible        "Do not bother with vi compat mode.
set encoding=utf8       " Force UTF8 whenever we can

if exists('+colorcolumn')
    set colorcolumn=80      " Add a stripe at the 80th column
endif

try
    lang en_US
catch
endtry

set mousemodel=popup    "Right click popup. I use keys for visual mode.
set expandtab           "expandtab, makes tabs to spaces
set shiftwidth=4        "Places tabspots at space(mod2)
set smarttab            "Makes backspace delete leading spaces like tabs

set listchars=tab:→·,trail:≠,nbsp:•,precedes:…,extends:↲ "show whitespace chars
set list                        " Enable display of whitespace chars

" places for ultisnips to search for snippets
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets/vim-snippets/UltiSnips"]
let g:UltiSnipsSnippetDirectories=["snippets/vim-snippets/UltiSnips"]

:let g:pyref_mapping = 'K'
:let g:pyref_python = '/usr/share/doc/python2.7'
" ShowMarks {
    let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    " Leave on by default, use :ShowMarksOn to enable
    let g:showmarks_enable = 1
    " For marks a-z
    highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
    " For marks A-Z
    highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
    " For all other marks
    highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
    " For multiple marks on the same line.
    highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" }

"Let us swap tabwidth on the fly if necessary
map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>

"tab control
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tc :tabnew<cr>
map <leader>td :tabclose<cr>

set backspace=indent,eol,start   " Set a backspace order what it will traverse
                                 "    and what it will skip over
set smartindent                  " Auto replace tab with spaces
set autoindent                   " Auto-indent in known closures
set foldmethod=syntax   "Set the fold method to use syntax. Fine for me.
set foldcolumn=4        "Add folding column to the left of the line numbers
set number              "Enable line numbers
set showmode            "Show if we're in insert mode on line 1
set showcmd             "Shows edit mode commands we've started to type
set hidden              "Allow unsaved buffers (no prompt to save on :bn)
set incsearch           "Turn on search as you type
set ignorecase          "Ignore case while searching except...
set smartcase           "except when user explicitly types caps
"set visualbell          "Flash the screen instead of beeping on error
"... Or just do this because the flashing is annoying me right now.
set noerrorbells
set visualbell t_vb=

set autoread            "autoread, if file has been changed outside vim
syntax on               "Syntax Hilighting on
set title               "we want to  update the window title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70  "what to make window title
set ttyfast             "y'ariba, yariba!
set winminheight=0      "Let us squash those windows if we wanna
set cul cuc             "Highlights the current cursor line
set isfname+=32         "Let vim use spaces in filenames properly
set sol                 "Let vim delete through line breaks
set history=50          "Give us more command history
set linebreak           "Only wrap long lines at word boundaries
set undofile            "Take advantage of the scary new persistent undo
set undodir=~/.vim/undos/


" Set a thesaurus file, just in case
if has("win32")
    set thesaurus=~\vimfiles\mthesaur.txt
else
    set thesaurus=~/.vim/mthesaur.txt
endif
" Eliminate escape delay
set timeoutlen=1000 ttimeoutlen=0

" Set backups off, versioning most stuff anyway, don't need the clutter of
" ~ files
set nobackup
set nowb
set noswapfile

"* Statusline
let g:syntastic_python_checkers=['flake8']
let g:syntastic_enable_signs=1  " Allow syntastic plugin to add markers
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1

set laststatus=2     " Make sure the windows all get status bars, not just
                     "     the focused one

"*Look and feel, windows or linux specific (font spec differences
if has("gui_win32")
    set gfn=DejaVu\ Sans\ Mono:h10
    au GUIEnter * simalt ~x
elseif has("gui_gtk")
    set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set shell=/bin/zsh
elseif has("gui_macvim")
    set shell=/bin/bash
endif

" Are we using gvim/macvim etc, or using it from the terminal?
if has("gui_running")
    "Remove some crud from gVim
    set guioptions-=T           "Remove toolbar
    set guioptions-=m           "Remove menubar
    set guioptions-=l           "Remove left scrollbar
    set guioptions-=r           "Remove right scrollbar
    set guioptions-=b           "Remove bottom scrollbar
else
    set mouse=a                 "enable the mouse
endif

" Add dashes to keyword tab completion chars
set iskeyword+=-

if has("gui_running") || &term == 'xterm-256color'
    set t_Co=256
    colorscheme vividchalk       "Color scheme
    set background=dark
else
    set background=dark
    colorscheme desert       "Color scheme
endif

"**************
"*Keybinds
"

"misc
"    Space toggles folds open and closed
noremap <space> za,

"    Open Quickfix or LL window
noremap <script> <silent> <F1> :call ToggleLocationList()<CR>
noremap <script> <silent> <S-F1> :call ToggleQuickfixList()<CR>

"    Open ctags taglist
"map <silent><F2> <ESC>:Tlist<CR>

noremap <silent><F3> <ESC> :VimFilerExplorer bookmark:<CR>
noremap <silent><F4> <ESC> :Unite buffer<CR>
noremap <silent><F5> <ESC> :Unite history/yank<CR>

noremap <F6> <ESC>:set sw=4 ts=4 et!<CR>
imap <F6> <ESC>:set sw=4 ts=4 et!<CR>a

"Insert current time
inoremap <F5> <C-R>=strftime("%c")<CR>
"Toggle spellchecking
map <silent><Leader>sc :set spell!<CR>

"Entites escaping
map <Leader>en :Entities<CR>j

"remap cursor keys for alternate movement
"   Linewise scrolling
map <Down> <c-e>
map <Up> <c-y>
"    Pgup/Pgdn
map <Left> <PageUp>
map <Right> <PageDown>

"set list to show tabs and trails
map ,h :set list!<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"* Skeletons
""" REMOVED MOST OLD SKELETONS FOR LACK OF MAINTENANCE
""" Look into https://github.com/pgilad/vim-skeletons

" Html skeleton with jquery
" TODO this is outdated, needs an update
noremap <Leader>sh :set ft=html<CR>i<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><CR><html><CR><head xmlns="http://www.w3.org/1999/xhtml"><CR><meta http-equiv="X-UA-Compatible" content="IE=edge" /><CR><title></title><CR><script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script><CR><script type="text/javascript"><CR>  $(document).ready(function() {<CR>  // js here<CR><BS><BS>});<CR><BS></script><CR><style type="text/css"><CR>body {<CR>}<CR></style><CR></head><CR><body><CR><CR></body><CR></html><ESC>


" When starting vim, reset position to last cursor position,
" and restore last buffers
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Split the window on startup
"

"if has("gui_running")
"    au VimEnter * call SetupWorkspace()
"endif

"**Filetype specific
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufNewFile,BufRead *.jinja set filetype=htmldjango tabstop=4 sts=4 sw=4 noet list

au FileType css,sass,scss                   set ts=4 sts=4 sw=4 noet fdm=indent list
au FileType python,dart,php                 set ts=4 sts=4 sw=4 noet fdm=indent list
au FileType lua,haskell,ruby                set sw=2 fdm=indent
au FileType html,htmldjango,xhtml,xml,yaml  set sw=4 fdm=indent
au FileType javascript,jquery               set ts=4 sts=4 sw=4 noet fdm=indent syntax=jquery list
au FileType vim                             set sw=4 et fdm=indent

au FileType python,javascript,jquery,sass,scss,css call rainbow#load()

let python_highlight_all = 1


"highlights interpolated variables in sql strings and does sql-syntax highlighting.
autocmd FileType php let php_sql_query=1
"does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
"discourages use of short tags.
autocmd FileType php let php_noShortTags=1
"automagically folds functions & methods.
autocmd FileType php let php_folding=1

" Automatically switch current working directory to current file's dir.
au BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

noremap <leader>h <Plug>(operator-html-escape)
noremap <leader>H <Plug>(operator-html-unescape)

"function! SetupWorkspace()
"    split
"    windo vsplit
"    NERDTreeToggle .
"endfunction

" Distinguish between HTML, XHTML and Django
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm  call s:FThtml()
func! s:FThtml()
  let n = 1
  while n < 10 && n < line("$")
    if getline(n) =~ '\<DTD\s\+XHTML\s'
      setf xhtml
      return
    endif
    if getline(n) =~ '{%\s*\(extends\|block\)\>'
      setf htmldjango
      return
    endif
    let n = n + 1
  endwhile
  setf html
endfunc

" NeoComplete
let g:neocomplcache_enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1

" Unite
let g:unite_source_history_yank_enable = 1
let g:vimfiler_as_default_explorer = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" VimFiler
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" GitGutter fix some of the colors
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

let g:airline_powerline_fonts = 1

" Chooseiwn overlays
let g:choosewin_overlay_enable = 1
map <leader>wc <Plug>(choosewin)
map <leader>ws <Plug>(choosewin-swap)
