" don't bother with vi compatibility
set nocompatible

filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype plugin indent on
set modeline

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]


" enable syntax highlighting
syntax enable

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set nobackup
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory

"" vim内部使用的编码方式， 包括Vim的buffer，菜单，消息等
set encoding=utf-8

""set fileencodings=utf-8,gb18030

"" vim自动探测的顺序表
set fileencodings=ucs-bom,utf-8,cp936

"" vim所工作的终端的自负编码方式
set termencoding=utf-8

set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
"set list                                                     " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full



" Enable basic mouse behavior such as resizing buffers.
"set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
"nmap <leader>a :Ack 
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'AutoClose'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/vim-scripts/a.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'

Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'OmniCppComplete'
Bundle 'snipMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'

" ...
filetype plugin indent on
 
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-powerline plugin
set laststatus=2
set t_Co=256
let g:Powerline_symbol = 'unicode'
set encoding=utf8

" taglist setting
let Tlist_WinWidth=40
let Tlist_Sort_Type="name"
let Tlist_Show_One_File=1  

" miniBufExplorer
""let g:miniBufExplorerMoreThanOne=0

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
""if exists('$TMUX')
""  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
""  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
""else
""  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
""  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
""endif

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif

""nnoremap <ESC> :noh<return> 
 
" ctags
set autochdir
set tags=tags;

if filereadable(expand("~/.cscope.vim"))
    source ~/.cscope.vim
endif

cmap pt set paste
cmap np set nopate

func BaiduSetComment()
    call setline(1,"/****************************************************************************")
    call append(line(".")," * ")
    call append(2," * Copyright (C) ".strftime("%Y")." Baidu.com, Inc. All rights reserved.")
    call append(3," * ")
    call append(4," ****************************************************************************/")
    call append(5,"")
    call append(6,"")
    call append(7,"")
    call append(8,"/** ")
    call append(9," * @file ".expand("%"))
    call append(10," * @author yinchunxiang(com@baidu.com)")
    call append(11," * @date " .strftime("%Y/%m/%d %H:%M:%S"))
    call append(12," * @brief ")
    call append(13," * ")
    call append(14," **/ ")
    call append(15," ")
    call append(16,"/* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */")
endfunc

autocmd BufNewFile *.c,*.cpp,*.cc exec ":call BaiduSetComment()"
autocmd BufNewFile *.h exec ":call BaiduSetComment()"

""自动将光标移动到末尾
autocmd BufNewFile * normal G

au BufRead *.c,*.cpp,*.cc,*.h,*.hpp,*.py set et nu sw=4 ts=4 tw=100
