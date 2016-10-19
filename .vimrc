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

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" make backspace work like fucking modern normal editor
set backspace=indent,eol,start

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
nmap <leader>h :noh<CR>

nmap <leader>e :Explore<CR>
nmap <leader>ee :Rexplore<CR>

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

let g:ctrlp_extensions = ['tag']

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

hi Comment ctermfg=black
hi VertSplit cterm=NONE ctermfg=black
hi StatusLine ctermfg=green ctermbg=NONE
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight Constant ctermfg=Blue
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
" highlight Special ctermbg=Red
"highlight Cursor ctermbg=Green
highlight LineNr ctermfg=black
set cursorline
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
" hi CursorLineNR cterm=none ctermfg=yellow
nmap <leader>f :browse oldfiles<CR>
nmap <leader>k ddkP
nmap <leader>j ddjP
