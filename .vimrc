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
Plugin 'majutsushi/tagbar'
Plugin 'sjl/vitality.vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/matchit.zip'
Plugin 'chriskempson/base16-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
" all Plugins to be added before this line.
call vundle#end()
filetype plugin indent on
"" Vundle end

"" YCM
" YCM prompt color
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
"jump to definition/declaration
nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"collect from comment and string
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"start from 2nd char
let g:ycm_min_num_of_chars_for_completion=2
"turn off cached choice
let g:ycm_cache_omnifunc=0
"syntax autoocmplete
let g:ycm_seed_identifiers_with_syntax=1
"works in comments
let g:ycm_complete_in_comments = 1
"works in strings
let g:ycm_complete_in_strings = 1
"omit in other plugins
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
" symantic completion
let g:ycm_key_invoke_completion = '<c-space>'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
""YCM finished
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
autocmd FileType sh setlocal shiftwidth=3 tabstop=3
set ttymouse=sgr " avoid mouse click insertion
set ignorecase
set smartcase
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
" set typo :X to :x
cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'
cnoreabbrev <expr> Q (getcmdtype() is# ':' && getcmdline() is# 'Q') ? 'q' : 'Q'

"Base16
let base16colorspace=256
colorscheme base16-tomorrow-night

" NERDTree
nmap <F5> :NERDTreeToggle<cr> 
" Tagbar
nmap <F8> :TagbarToggle<CR>
" IndentLine
nmap <F4> :IndentLinesToggle<CR>
" Paste Mode
set pastetoggle=<F3>

" Change cursor shape
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vim-Airline
set laststatus=2  " always show status bar
let g:airline_powerline_fonts = 1  " support powerline font  
let g:airline#extensions#tabline#enabled = 1 " show buffer and tabline 
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tagbar#enabled = 1

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
