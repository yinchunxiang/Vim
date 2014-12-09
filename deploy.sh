mkdir -p ~/.vim
cd "$(dirname $0)"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qa
