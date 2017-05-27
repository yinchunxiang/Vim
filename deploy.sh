#enter the directory of this script
cd "$(dirname $0)"

#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#rm -f ~/.vimrc
mv ~/.vimrc ~/.vimrc_bak
ln -s $(pwd)/vimrc ~/.vimrc 

rm -rf ~/.vim
ln -s $(pwd)/ ~/.vim

rm -f ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig

vim +BundleInstall +qa


