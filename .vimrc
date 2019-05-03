runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on

set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2

set fillchars=vert:⎸,diff:\ ,fold:-

set ignorecase
set cursorline
set noshowmode
set colorcolumn=100
set clipboard=unnamed
set mouse=a
" set paste

" set foldmethod=syntax
" set foldlevelstart=99

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" gui config
" set guifont=D2Coding:h16
set guifont=SF\ Mono\ Regular:h11
set guioptions-=m   " remove Menu bar
set guioptions-=T   " remove Tool bar
set guioptions-=r   " remove Right bar
set guioptions-=L   " remove Left bar

runtime .coc.nvim
runtime .ConqueGDB
runtime .csv.vim
runtime .fastfold
runtime .fswitch
runtime .fzf
runtime .indentLine
runtime .nerdtree
runtime .rainbow_parentheses
runtime .SymplylFold
runtime .switch.vim
runtime .syntastic
runtime .tagbar
runtime .vim-clang-format
runtime .vim-gitgutter
runtime .vim-hightlightyank

set cmdheight=1
set background=dark
colorscheme codedark
hi folded ctermfg=yellow guifg=yellow cterm=none gui=none
hi foldcolumn ctermfg=yellow guifg=yellow

"
" python formatting
"
" au BufNewFile,BufRead *.py
" 			\ set tabstop=4
" 			\ set shiftwidth=4
" 			\ set softtabstop=4
" 			\ set textwidth=79
" 			\ set colorcolumn=80
" 			\ set expandtab
" 			\ set autoindent
" 			\ set fileformat=unix

"
" mark unnecessary white space to red
"
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.cc,*.cpp,*.c++,*.h,*.hpp,*.h++,*.sh match BadWhitespace /\s\+$/
