git init
git remote add origin git@github.ibm.com:Xi-Sun/dotfiles.git
git fetch
git checkout-t origin/master -f
git submodule update --init --recursive

cd ~/.vim/bundle/YouCompleteMe
./install.py --all
