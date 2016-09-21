set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'albfan/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

set number
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight LineNr cterm=NONE ctermfg=black ctermbg=NONE
set showmatch

set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

" Take advantage of 2016's memory abundance
set hidden
set history=100

nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>

"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l

imap jj <C-c>

" :set so=999

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"folding settings
set foldmethod=indent   "fold based on indent
set nofoldenable

syntax on
set nospell

" this is so I can see non-unix(windows) line endings that eff up coffee lint
set fileformats=unix
set shell=bash\ --login

" silver search word under cursor
nnoremap <leader>\ yiw :Ag! <c-r>"<CR>

" :hi CursorLine cterm=underline ctermbg=none ctermfg=none
" The Silver Searcher
if executable('ag')
" Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" vim-tmux-navgigator stuff
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
