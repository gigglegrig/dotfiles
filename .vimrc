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
Plugin 'sjl/vitality.vim'
Plugin 'w0rp/ale'

" all Plugins to be added before this line.
call vundle#end()
filetype plugin indent on
"" Vundle end

"" YCM
" YCM prompt color
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
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
""YCM finished

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
"if $TERM_PROGRAM =~"iTerm"
"    let &t_SI ="\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"    let &t_EI ="\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif
"
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vim-Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2

""ALE plugin
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
"shortcut
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"<Leader>d show error detail
nmap <Leader>d :ALEDetail<CR>
nmap <F7> ::ALEToggle<CR>
" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
" let g:ale_lint_on_enter = 0


