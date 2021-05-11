set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required""
""
""
set splitbelow
set nocompatible
set mouse=a
set mousemodel=extend
set number
syntax on
set backspace=indent,eol,start
set hlsearch
set expandtab
set gcr=a:blinkon0
set showmode
"set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
autocmd FileType scala setlocal shiftwidth=4 tabstop=4
autocmd FileType sh,bash,c setlocal shiftwidth=3 tabstop=3
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
set ttymouse=sgr " avoid mouse click insertion
set ignorecase
set smartcase
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
" set typo :X to :x
cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'
cnoreabbrev <expr> Q (getcmdtype() is# ':' && getcmdline() is# 'Q') ? 'q' : 'Q'
""
"" Misc
""

" update color scheme
if filereadable(expand("~/.vimrc_background"))
   let base16colorspace=256
   source ~/.vimrc_background
endif

" rename tmux windows to use file names
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")
""ALE plugin
"theme
let g:airline_theme='angr'
" airline integration
let g:airline#extensions#ale#enabled = 1
" turn sign column always on
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" customiz error and warning
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"status bar integration
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"show liner name
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_list_window_size = 20

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"<Leader>d show error detail
nmap <F6> :ALEDetail<CR>
nmap <F7> :ALEToggle<CR>
" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
" let g:ale_lint_on_enter = 0

inoremap <C-A> <Home>
inoremap <C-E> <End>

if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
