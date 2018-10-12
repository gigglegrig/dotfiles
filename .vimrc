"for Vundle installation
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'

" all Plugins to be added before this line.
call vundle#end()
filetype plugin indent on
"" Vundle end

" autocomplete UI color
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

set nocompatible
set mouse=a
set number
syntax on
set backspace=indent,eol,start
set hlsearch
set expandtab
set gcr=a:blinkon0
set showmode
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase

"Bash16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set to system clipboard
set clipboard=unnamed

" NERDTree
nmap <F5> :NERDTreeToggle<cr> 
" Tagbar
nmap <F8> :TagbarToggle<CR>


" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" vim-Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2

