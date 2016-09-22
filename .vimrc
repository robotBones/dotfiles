set nocompatible   " be iMproved, required
filetype off       " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'albfan/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'tpope/vim-commentary'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Take advantage of 2016's memory abundance
set hidden
set history=100

set number
set showmatch

set hlsearch

" aliases
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>

imap jj <C-c>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nmap <leader>h :noh<CR>

nmap <leader>e :e .<CR>

nmap <leader>b :BuffergatorToggle<CR>
nmap <leader>tt :TagbarToggle<CR>
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
  let g:ctrlp_use_caching = 1
endif
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|node_modules$|vendor$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
" vim-tmux-navgigator stuff
let g:tmux_navigator_no_mappings = 1
let g:ctrlp_working_path_mode = 'r'
let g:CoffeeAutoTagIncludeVars = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

:hi Comment ctermfg=black
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight LineNr cterm=NONE ctermfg=black ctermbg=NONE
"highlight Comment ctermbg=DarkGray
"highlight Constant ctermbg=Red
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
"highlight Special ctermbg=Red
"highlight Cursor ctermbg=Green
