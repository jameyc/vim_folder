"""""""""""""""""""""""""""""""""""""""
"JameyC's .vimrc
"
"  Use with caution, or better yet,
"  don't use at all. Write your own,
"  you lazy sod.
"""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect() "get pathogen going, for all pathogen installed plugins

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
filetype plugin on

" Some sane defaults for NERDTree
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$']

" Set backups off, versioning most stuff anyway, don't need the clutter of
" ~ files
set nobackup
set nowb
set noswapfile

"* Statusline
let g:syntastic_enable_signs=1  " Allow syntastic plugin to add markers
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1

set statusline=%t%m%r%h%w\ [FF=%{&ff}]\ [FT=%Y]\ [Tab=%{&sw},%{&sw},%{&et?'--':'→·'}]%=%{SyntasticStatuslineFlag()}\ %{fugitive#statusline()}\ [LEN=%L]\ [POS=%04l,%04v][%p%%]
"endif
set laststatus=2     " Make sure the windows all get status bars, not just
                     "     the focused one

"*Look and feel, windows or linux specific (font spec differences
if has("gui_win32")
    set gfn=DejaVu\ Sans\ Mono:h10
    au GUIEnter * simalt ~x
elseif has("gui_gtk")
    set gfn=DejaVu\ Sans\ Mono\ 11
    set shell=/bin/zsh
elseif has("gui_macvim")
    set shell=/bin/bash
endif

" Are we using gvim/macvim etc, or using it from the terminal?
if has("gui_running")
    "Set reasonable options for gvim, like big screen size
    set lines=44
    set columns=170
    set guioptions-=T           "Remove toolbar
    set guioptions-=m           "Remove menubar
    set guioptions-=l           "Remove left scrollbar
    set guioptions-=r           "Remove right scrollbar
    set guioptions-=b           "Remove bottom scrollbar
else
    set mouse=a                 "enable the mouse
endif

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
"quick buffer movement
"   - Hit ,1 through ,0 for buffs 1-0. Hit ,g for last buffer
map ,1 :1b<CR>
map ,2 :2b<CR>
map ,3 :3b<CR>
map ,4 :4b<CR>
map ,5 :5b<CR>
map ,6 :6b<CR>
map ,7 :7b<CR>
map ,8 :8b<CR>
map ,9 :9b<CR>
map ,0 :10b<CR>
map ,g :e#<CR>

"misc
"    Open Quickfix or LL window
nmap <script> <silent> <F1> :call ToggleLocationList()<CR>
nmap <script> <silent> <S-F1> :call ToggleQuickfixList()<CR>
"    Open ctags taglist
map <silent><F2> <ESC>:Tlist<CR>
"    Open NERDtree
map <silent><F3> <ESC>:NERDTreeToggle .<CR>
"    Open BufExplorer
map <silent><F4> :BufExplorer<CR>

map <F6> <ESC>:set sw=4 ts=4 et!<CR>
imap <F6> <ESC>:set sw=4 ts=4 et!<CR>a
"    Open Calendar
map <F8> :Calendar<CR>

"fullscreen for windows
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 

"quick write
map <Leader>w :w<CR>
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
" A ruby-skeleton with a timestamp
" TODO - fix the datestamps for win or posix
noremap <Leader>sr :set ft=ruby<CR>i#!/usr/bin/env ruby<CR>-*-coding:utf-8-*-<CR>vim: set enc=utf8:<CR><CR> author:   Jamey Campbell <jameyc@gmail.com><ESC>:r!date -u<CR><ESC>0i# date:     <ESC>o<CR>description:<CR><ESC>40i#<ESC>o<ESC>cl<CR>def main<CR>  <CR><ESC>0iend<CR><CR>if __FILE__ == $0<CR>  main<CR><ESC>0iend<ESC>5k


" Python Skeleton with a timestamp
" TODO - fix the datestamps for win or posix
noremap <Leader>sp :set ft=python<CR>i#!/usr/bin/env python<CR>#-*-coding:utf-8-*-<CR>#vim: set enc=utf8:<CR>#<CR># author:   Jamey Campbell <jameyc@gmail.com<ESC>:r!date -u<CR><ESC>0i# date:     <ESC>o<CR><ESC>0i# date:     <ESC>o#<CR><CR>def main():<CR>    <CR><CR><CR><BS><BS>if __name__ == "__main__":<CR>    main()<CR><ESC>4ki


" Html skeleton with jquery
" TODO this is outdated, needs an update
noremap <Leader>sh :set ft=html<CR>i<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><CR><html><CR><head xmlns="http://www.w3.org/1999/xhtml"><CR><meta http-equiv="X-UA-Compatible" content="IE=edge" /><CR><title></title><CR><script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script><CR><script type="text/javascript"><CR>  $(document).ready(function() {<CR>  // js here<CR><BS><BS>});<CR><BS></script><CR><style type="text/css"><CR>body {<CR>}<CR></style><CR></head><CR><body><CR><CR></body><CR></html><ESC>


" When starting vim, reset position to last cursor position,
" and restore last buffers
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Split the window on startup
"

if has("gui_running")
    au VimEnter * call SetupWorkspace()
endif

"**Filetype specific
"* vimrc
au FileType vim                   set sw=4 expandtab foldmethod=indent
"* Ruby
au FileType ruby                  set sw=2 expandtab

"* Python
au FileType python                set sw=4 foldmethod=indent
let python_highlight_all = 1

"* Lua
au FileType lua                   set sw=2
au FileType lua                   set foldmethod=indent

"* Actionscript
au BufNewFile,BufRead *.as        set filetype=actionscript
au FileType actionscript          set sw=4

"* Html, misc
au FileType css                   set sw=2
au FileType sass                  set sw=2
au FileType scss                  set sw=2
au FileType html                  set sw=2
au FileType xhtml                 set sw=2
au FileType xml                   set sw=2
au FileType xml                   set foldmethod=indent
au FileType yaml                  set sw=2
au FileType dart                  set ts=4 sts=4 sw=4 noet foldmethod=indent
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

""" Temporty for current project...
au FileType javascript set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=indent syntax=jquery
au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=indent


"* PHP
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
au FileType scss set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=indent

"set errorformat=%m\ in\ %f\ on\ line\ %l
"highlights interpolated variables in sql strings and does sql-syntax highlighting.
autocmd FileType php let php_sql_query=1
"does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
"discourages use of short tags.
autocmd FileType php let php_noShortTags=1
"automagically folds functions & methods.
autocmd FileType php let php_folding=1

au FileType haskell set sw=2

" Path for pydocs, on win32 - for inline syntax docs
if has("win32")
    let g:pydoc_cmd = "c:/Python26/lib/pydoc.py"
endif

" Automatically switch current working directory to current file's dir.
"au BufEnter * lcd %:p:h
au BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

"Adds an ":Entities command to replace some annoying chars like smartquotes
"and apostrophes with their html escaped versions.
"   - todo - make this take ranges.
command Entities :call Entities()
function! Entities()
  silent s/À/\&Agrave;/eg
  silent s/Á/\&Aacute;/eg
  silent s/Â/\&Acirc;/eg
  silent s/Ã/\&Atilde;/eg
  silent s/Ä/\&Auml;/eg
  silent s/Å/\&Aring;/eg
  silent s/Æ/\&AElig;/eg
  silent s/Ç/\&Ccedil;/eg
  silent s/È/\&Egrave;/eg
  silent s/É/\&Eacute;/eg
  silent s/Ê/\&Ecirc;/eg
  silent s/Ë/\&Euml;/eg
  silent s/Ì/\&Igrave;/eg
  silent s/Í/\&Iacute;/eg
  silent s/Î/\&Icirc;/eg
  silent s/Ï/\&Iuml;/eg
  silent s/Ð/\&ETH;/eg
  silent s/Ñ/\&Ntilde;/eg
  silent s/Ò/\&Ograve;/eg
  silent s/Ó/\&Oacute;/eg
  silent s/Ô/\&Ocirc;/eg
  silent s/Õ/\&Otilde;/eg
  silent s/Ö/\&Ouml;/eg
  silent s/Ø/\&Oslash;/eg
  silent s/Ù/\&Ugrave;/eg
  silent s/Ú/\&Uacute;/eg
  silent s/Û/\&Ucirc;/eg
  silent s/Ü/\&Uuml;/eg
  silent s/Ý/\&Yacute;/eg
  silent s/Þ/\&THORN;/eg
  silent s/ß/\&szlig;/eg
  silent s/à/\&agrave;/eg
  silent s/á/\&aacute;/eg
  silent s/â/\&acirc;/eg
  silent s/ã/\&atilde;/eg
  silent s/ä/\&auml;/eg
  silent s/å/\&aring;/eg
  silent s/æ/\&aelig;/eg
  silent s/ç/\&ccedil;/eg
  silent s/è/\&egrave;/eg
  silent s/é/\&eacute;/eg
  silent s/ê/\&ecirc;/eg
  silent s/ë/\&euml;/eg
  silent s/ì/\&igrave;/eg
  silent s/í/\&iacute;/eg
  silent s/î/\&icirc;/eg
  silent s/ï/\&iuml;/eg
  silent s/ð/\&eth;/eg
  silent s/ñ/\&ntilde;/eg
  silent s/ò/\&ograve;/eg
  silent s/ó/\&oacute;/eg
  silent s/ô/\&ocirc;/eg
  silent s/õ/\&otilde;/eg
  silent s/ö/\&ouml;/eg
  silent s/ø/\&oslash;/eg
  silent s/ù/\&ugrave;/eg
  silent s/ú/\&uacute;/eg
  silent s/û/\&ucirc;/eg
  silent s/ü/\&uuml;/eg
  silent s/ý/\&yacute;/eg
  silent s/þ/\&thorn;/eg
  silent s/ÿ/\&yuml;/eg
  silent s/’/\&#39;/eg
  silent s/“/\&#8220;/eg
  silent s/”/\&#8221;/eg
  silent s/™/\&trade;/eg
  silent s/’/&#8217;/eg
  silent s/…/\&hellip;/eg
  silent s/\.\.\./\&hellip;/eg
  silent s/–/-/eg
endfunction

function SetupWorkspace()
    split
    windo vsplit
    NERDTreeToggle .
endfunction

