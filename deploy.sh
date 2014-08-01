cd "$(dirname $0)"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
if [ ! -f ~/.vimrc ];then
    cp .vimrc .gvimrc ~/
fi
if [ ! -f ~/.vim/bundle ];then
    mkdir -p ~/.vim
    cp -r bundle ~/.vim
fi
vim +BundleInstall +qa
