#enter the directory of this script
cd "$(dirname $0)"

#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
rm -f ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc 

rm -rf ~/.vim
ln -s $(pwd)/ ~/.vim

vim +BundleInstall +qa
