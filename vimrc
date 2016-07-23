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
set guifont=Menlo:h14
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
set relativenumber
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
"map <leader>l :Align
""nmap <leader>a :Ack 
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

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
Plugin 'gmarik/vundle'
 
" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'AutoClose'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/vim-scripts/a.vim.git'
Plugin 'git://github.com/tpope/vim-surround.git'

Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'
Plugin 'bufexplorer.zip'
Plugin 'OmniCppComplete'
Plugin 'snipMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'

" ...
filetype plugin indent on
 
"
" Brief help  -- 此处后面都是vundle的使用命令
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
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

nnoremap <leader>p :set invpaste paste?<CR>

func BaiduSetComment()
    call setline(1,"/****************************************************************************")
    call append(line(".")," * ")
    call append(2," * Copyright (C) ".strftime("%Y")." @com, Inc. All rights reserved.")
    call append(3," * ")
    call append(4," ****************************************************************************/")
    call append(5,"")
    call append(6,"")
    call append(7,"")
    call append(8,"/** ")
    call append(9," * @file ".expand("%"))
    call append(10," * @author yinchunxiang(@com)")
    call append(11," * @date " .strftime("%Y/%m/%d %H:%M:%S"))
    call append(12," * @brief ")
    call append(13," * ")
    call append(14," **/ ")
    call append(15," ")
    call append(16,"")
    call append(17,"")
    call append(18,"")
    call append(19,"")
    call append(20,"")
    call append(21,"")
    call append(22,"")
    call append(23,"")
    call append(24,"")
    call append(25,"")
    call append(26,"")
    call append(27,"")
    call append(28,"")
    call append(29,"")
    call append(30,"/* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */")
endfunc

autocmd BufNewFile *.c,*.cpp,*.cc exec ":call BaiduSetComment()"
autocmd BufNewFile *.h exec ":call BaiduSetComment()"

""自动将光标移动到末尾
autocmd BufNewFile * normal 17gg

""au BufRead *.c,*.cpp,*.cc,*.h,*.hpp,*.py set et nu sw=4 ts=4 tw=100

set mouse=v

set hlsearch

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

""""""""""""""""""""""""tmux""""""""""""""""""""""""""

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
 
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
 
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
 
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
 
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
 
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
 
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if exists('$TMUX')
  set term=screen-256color
endif

