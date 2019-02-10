runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on

set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
set colorcolumn=100
set clipboard=unnamed
"set foldmethod=syntax
"set foldlevelstart=99
"set paste
"set mouse=a

nmap <F8> :TagbarToggle<CR>

"" split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

colorscheme codedark
"let g:airline_theme = 'dark'

"
" NERDTree
"
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


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
" YouCompleteMe
" 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
" UltiSnips
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<TAB>"
"let g:UltiSnipsJumpForwardTrigger="<C-B>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Z>"
let g:UltiSnipsExpandTrigger="<C-K>"
let g:UltiSnipsJumpForwardTrigger="<C-K>"
let g:UltiSnipsJumpBackwardTrigger="<C-I>"
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

"
" python formatting
"
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set shiftwidth=4
"     \ set softtabstop=4
"     \ set textwidth=79
"     \ set colorcolumn=80
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

"
" mark unnecessary white space to red
"
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.cc,*.cpp,*.c++,*.h,*.hpp,*.h++,*.sh match BadWhitespace /\s\+$/
