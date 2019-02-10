runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on

set encoding=utf-8

set tabstop=2
set shiftwidth=2
set ignorecase
set colorcolumn=100
set clipboard=unnamed
"set paste
"set mouse=a

nmap <F8> :TagbarToggle<CR>

colorscheme codedark
"let g:airline_theme = 'dark'

"
" NERDTree
"
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"
" ctrlp.vim
"
"nmap <C-p> :CtrlP<CR>
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe,*.dll,*.o,*.obj,*.pdb,*.dbg 

"
" airline
"
let g:airline_powerline_fonts = 1
let g:promptline_powerline_symbols = 1

"
" GVim Config
"
"set guifont=D2Coding:h16
set guifont=SF\ Mono\ Regular\ Nerd\ Font\ Complete:h11
set guioptions-=m   " remove Menu bar
set guioptions-=T   " remove Tool bar
set guioptions-=r   " remove Right bar
set guioptions-=L   " remove Left bar

"
" fzf.vim
"
set rtp+=~/.fzf

"
" clang-format
"
let g:clang_format#detect_style_file = 1
"let g:clang_format#auto_format = 1
"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#auto_formatexpr = 1
"let g:clang_format#enable_fallback_style = 1

set equalprg=clang-format

"
" C++17
"
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++17'

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
"let g:cpp_no_function_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_simple_highlight = 1

"
" powerline
"
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

"
" Bind <leader>y to forward last-yanked text to Clipper
"
nnoremap <leader>y :call system('nc ${CLIPPER_SERVER} 8377', @0)<CR>

"
" ConqueGDB Setting
"
let g:ConqueTerm_Color=2            " 1: strip color after 200 line, 2: always with color
let g:ConqueTerm_CloseOnEnd=1       " close conque when program ends running
let g:ConqueTerm_StartMessages=0    " display warning message if conqueTerm is configed incorrect

"
" UltiSnips
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"
" SimpylFold
"
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
let b:SimpylFold_fold_import = 1

"
" fastfold
"
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
