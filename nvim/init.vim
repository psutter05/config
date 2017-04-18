"*****************************************************************************
"" Start vim-plug
"*****************************************************************************

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/
  set runtimepath+=~/.config/nvim/
endif

let plug_readme=expand('~/.config/nvim/bundle/plug.vim')

if !filereadable(plug_readme)
  echo "Installing vim plug..."
  echo ""
  silent !curl -fLo ~/.config/nvim/bundle/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


""*****************************************************************************
""" Registers and configure packages
""*****************************************************************************

call plug#begin(expand('~/.config/nvim/bundle'))

""*****************************************************************************
" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'


""*****************************************************************************
" comment operator
Plug 'tpope/vim-commentary'


""*****************************************************************************
" fish syntax
Plug 'dag/vim-fish', { 'for': 'fish' }


""*****************************************************************************
" vim fugitive
Plug 'tpope/vim-fugitive'


""*****************************************************************************
" autocompletion
" need to install neovim with pip2
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1


""*****************************************************************************
" solarized
Plug 'lifepillar/vim-solarized8', { 'do': 'cp ~/.config/nvim/bundle/vim-solarized8/colors/* ~/.config/nvim/colors/' }
colorscheme solarized8_dark


""*****************************************************************************
" nerdtree
Plug 'scrooloose/nerdtree'

" Open NerdTree when opening directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Ignore some files
let NERDTreeIgnore = ['\.pyc$', '__pycache__']


""*****************************************************************************
" nerdtree syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


""*****************************************************************************
" nerdtree plugin for git
Plug 'Xuyuanp/nerdtree-git-plugin'


""*****************************************************************************
" tabs nerdtree plugin
Plug 'jistr/vim-nerdtree-tabs'

" Ctrl-n is NerdTree
nnoremap <C-n> :NERDTreeTabsToggle<CR>

" Close tabs before leaving
autocmd VimLeave * NERDTreeTabsClose


""*****************************************************************************
" project support for vim
Plug 'embear/vim-localvimrc'
let g:localvimrc_count = 1
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0


""*****************************************************************************
"" python refactoring
Plug 'python-rope/ropevim', { 'do': 'sudo pip2 install neovim rope' }


""*****************************************************************************
"" python refactoring
Plug 'fs111/pydoc.vim', { 'for': 'python' }

""*****************************************************************************
"" python refactoring
Plug 'python-mode/python-mode', { 'for': 'python' }
let g:pymode_folding=1
let g:pymode_indent=1
let g:pymode_motion=1
let g:pymode_doc=0
let g:pymode_lint=0
let g:pymode_rope=0
let g:pymode_virtualenv=0
let g:pymode_run=0
let g:pymode_breakpoint=0


""*****************************************************************************
" asynchronous syntax checking
Plug 'neomake/neomake'
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_python_flake8_maker = {
    \ 'args': ['--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']


""*****************************************************************************
" python backend for deoplete
Plug 'zchee/deoplete-jedi', { 'for': 'python'}
let g:deoplete#sources#jedi#statement_length = 10
let g:deoplete#sources#jedi#show_docstring = 1
" close popup window upon stopping completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


""*****************************************************************************
" auto-indentation for python, support for open parentheses
Plug 'vim-scripts/indentpython.vim', { 'for': 'python'}


""*****************************************************************************
" highlight trailing whitespaces
Plug 'vim-scripts/ShowTrailingWhitespace'


""*****************************************************************************
" icons
Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


""*****************************************************************************
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


""*****************************************************************************
" save sessions automatically
Plug 'usefulparadigm/vim-autosession'

call plug#end()


""*****************************************************************************
""" Basic Setup
""*****************************************************************************"

" syntax and filetype indentation
syntax on
syntax enable
filetype indent on

" python pep8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79

set expandtab
set autoindent
set fileformat=unix
set backspace=indent,eol,start

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" utf8
set encoding=utf-8
set guifont=DroidSansMonoPLNerd:h12

" enable folding with the spacebar
nnoremap <space> za
set foldlevel=99

" shell is fish
set shell=/bin/bash

" ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" mouse
set mouse=a

" search highlight patterns
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
set incsearch

" better support for tabs
" add suport for navigation to tabs directly
" need to get rid of terminal shortcuts
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-q>     :tabclose<CR>

" colors for tabs
hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

" ruler
set ruler
set wildmenu

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" use python2.7
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'
