cd "$(dirname $0)"
git clone http://github.com/gmarik/vundle.git ./bundle/vundle
vim +BundleInstall +qa
