runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on

set encoding=utf-8
" set textwidth=100

set tabstop=2
set shiftwidth=2
set softtabstop=2

set laststatus=2

" set fillchars+=vert:⎸
" set fillchars+=diff:\ ,fold:-

set expandtab
set ignorecase
set smartcase
set cursorline
set noshowmode
set colorcolumn=100
set clipboard=unnamed
set mouse=a
set hlsearch
set incsearch
" set paste

set nofoldenable
set foldmethod=syntax
" set foldlevelstart=99

function! FoldText()
  " Description: Folding configuration

  " TODO ALE indication column is not counted
  let winwidth = winwidth(0)
        \ - &fdc
        \ - &number*&numberwidth
        \ - (&l:signcolumn is# 'yes' ? 2 : 0)

  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let foldinfo = "   ( " . string(foldlinecount) . " lines )   "

  let tabreplace = repeat(" ", &tabstop)
  let foldstartline = substitute(getline(v:foldstart), '[\t]', tabreplace, 'g')

  if &foldmethod == "indent"
    let foldsummary = foldstartline . "..."
  else
    let foldendline = substitute(getline(v:foldend), '^\s*\(.\{-}\)\s*$', '\1', '')
    let foldsummary = foldstartline . "..." . foldendline
  endif
  let cuttedsummary = strpart(foldsummary, 0 , winwidth - len(foldinfo))

  let fillcharcount = winwidth - len(cuttedsummary) - len(foldinfo)

  return cuttedsummary . repeat(" ",fillcharcount) . foldinfo
endfunction

set foldtext=FoldText()

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" gui config
" set guifont=D2Coding:h14
set guifont=SFMonoNerdFontC-Regular:h13

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set guioptions-=m   " remove Menu bar
set guioptions-=T   " remove Tool bar
set guioptions-=r   " remove Right bar
set guioptions-=L   " remove Left bar

runtime .coc.nvim
" runtime .ConqueGDB
" runtime .csv.vim
" runtime .fastfold
" runtime .fswitch
runtime .fzf
runtime .indentLine
runtime .nerdtree
" runtime .rainbow_parentheses
" runtime .SymplylFold
" runtime .switch.vim
" runtime .syntastic
runtime .tagbar
runtime .vim-clang-format
runtime .vim-gitgutter
runtime .vim-hightlightyank

set cmdheight=1
" set background=dark
" colorscheme codedark

colorscheme github
let g:lightline = { 'colorscheme': 'github' }
" let g:airline_theme = "github"

"
" python formatting
"
au BufNewFile,BufRead *.py
\ set autoindent |
\ set colorcolumn=80 |
\ set expandtab |
\ set fileformat=unix |
\ set shiftwidth=4 |
\ set softtabstop=4 |
\ set tabstop=4 |
\ set textwidth=79 

"
" mark unnecessary white space to red
"
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.cc,*.cpp,*.c++,*.h,*.hpp,*.h++,*.sh match BadWhitespace /\s\+$/

" custom colors
" hi  folded            cterm=none    ctermfg=yellow  gui=none        guifg=yellow
" hi  foldcolumn                      ctermfg=yellow                  guifg=yellow
" hi! myCursorWordMatch               ctermfg=015     ctermbg=208     guifg=#000000 guibg=#ff8700
" hi! CursorLine        term=reverse                  ctermbg=000                   guibg=darkgrey
" hi! Search                                          ctermbg=022                   guibg=#005f00
" hi! CocHighlightText  term=reverse                  ctermbg=222                   guibg=#f2e496

" custom key mapping
nnoremap <F5> :match myCursorWordMatch /<C-R><C-W>/<CR>

" autocmd
autocmd CursorMoved * match

let g:ClipperAddress = $CLIPPER_SERVER
call clipper#set_invocation('nc -N $CLIPPER_SERVER 8377')
