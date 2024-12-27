set encoding=UTF-8

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.*~  " Windows

highlight LineNr ctermfg=grey

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
nmap <F5> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

set ic

""""""""""" Set tab to 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


""""""""""" Display line numbers
set nu


""""""""""" Disable error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


""""""""""" Key mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
map  <C-n> :NERDTreeToggle<CR>
map  <C-p> :find
" xmap  <C-q> :wq<CR>

""" from Andrew
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nmap = +
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k
nmap DD d5d
xmap DD d5d
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
nmap <C-l> gt
nmap <C-h> gT
nmap <C-/> :nohl<CR>


""""""""""" Close vim when NERDTree is the only split left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""" Open NERDTree by default
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""""""""""" Start Enable Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set The runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

""" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" TODO - review following plugins
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
" Plugin 'instant-markdown/vim-instant-markdown'
Plugin 'ervandew/supertab'                          " better tab completion
Plugin 'leafgarland/typescript-vim'
Plugin 'dense-analysis/ale'

""" Syntax highlighting
Plugin 'Sheerun/vim-polyglot'
Plugin 'wuelnerdotexe/vim-astro'

""" Themes
" Plugin 'ryanoasis/vim-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'Rigellute/shades-of-purple.vim'
Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""" End Enable Vundle


set nocompatible              " be iMproved, required
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"""" enable 24bit true color
" If you have vim >=8.0 or Neovim >= 0.1.5
" Enable true color 启用终端24位色
syntax enable
set guioptions-=r
set cursorline
if (has('termguicolors'))
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors
 colorscheme shades_of_purple
else
 colorscheme gruvbox
 set bg=dark
endif


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" set directory where swap files are stored
silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
set swapfile
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//

" set window size
" if has("gui_running")
"   " GUI is running or is about to start.
"   set lines=50 columns=200
" else
"   " This is console Vim.
"   if exists("+lines")
"     set lines=50
"   endif
"   if exists("+columns")
"     set columns=200
"   endif
" endif

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
