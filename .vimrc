filetype indent on
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

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

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

filetype on
syntax on
set nospell

" this is so I can see non-unix(windows) line endings that eff up coffee lint
set fileformats=unix
set shell=bash\ --login

" silver search word under cursor
nnoremap <leader>\ yiw :Ag! <c-r>"<CR>

" :hi CursorLine cterm=underline ctermbg=none ctermfg=none
