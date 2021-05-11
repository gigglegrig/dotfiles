set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required""
""
""
"" General
""
" enable mouse mode
set mouse=a

" show line numbers
set number

" show existing tab with 3 spaces width
set tabstop=3

" when indenting with '>', use 3 spaces width
set shiftwidth=3

" On pressing tab, insert 3 spaces
set expandtab

" 100 character limit line
set colorcolumn=100

" change completion behaviour
set wildmode=longest,list,full

" enable syntax highlighting
syntax on

" enable search highlighting
set hlsearch

" set fold on syntax
set foldmethod=syntax
set foldlevel=99

""
"" Misc
""
let base16colorspace=256  " Access colors present in 256 colorspace

" update color scheme
if filereadable(expand("~/.vimrc_background"))
   let base16colorspace=256
   source ~/.vimrc_background
endif

" rename tmux windows to use file names
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")
