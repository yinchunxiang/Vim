diff --git a/vimrc b/vimrc
index e589bce..342c3e0 100644
--- a/vimrc
+++ b/vimrc
@@ -1,9 +1,12 @@
-" set up pathogen, https://github.com/tpope/vim-pathogen
 filetype on " without this vim emits a zero exit status, later, because of :ft off
 filetype off
-call pathogen#infect()
 filetype plugin indent on
 
+"匹配括号的规则，增加针对html的<>
+set matchpairs=(:),{:},[:],<:>
+"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
+set whichwrap=b,s,<,>,[,]
+
 " don't bother with vi compatibility
 set nocompatible
 
@@ -98,12 +101,15 @@ Bundle 'FuzzyFinder'
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'https://github.com/Lokaltog/vim-powerline.git'
 Bundle 'https://github.com/kien/ctrlp.vim.git'
+Bundle 'https://github.com/vim-scripts/a.vim.git'
 
 Bundle 'The-NERD-tree'
 Bundle 'taglist.vim'
 Bundle 'minibufexpl.vim'
 Bundle 'bufexplorer.zip'
 Bundle 'OmniCppComplete'
+Bundle 'snipMate'
+
 " ...
 filetype plugin indent on
  
