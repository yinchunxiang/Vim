mkdir -p ~/.vim

#enter the directory of this script
cd "$(dirname $0)"

#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#vim +BundleInstall +qa
rm -f ~/.vimrc
ln -s vimrc ~/.vimrc 

rm -rf ~/.vim
ln -s ../Vim ~/.vim
