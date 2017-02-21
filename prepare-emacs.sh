# emacs
which emacs
if [ $? -ne 0 ]; then
    sudo apt-get -y install emacs
fi
echo '=> Emacs is installed'

## config emacs preparetion
sudo apt-get install ruby-dev
sudo gem install redcarpet --conservative

sudo apt-get install graphviz


## add config files

#echo '==> Original emacs files:'
#ls ~/.emacs*

sudo mkdir -p ~/.config/

rm -rf ~/.config/flake8.bak
rm -rf ~/.emacs.bak
rm -rf ~/.emacs.d.bak

#echo '==> After removed:'
#ls ~/.emacs*
mv -f ~/.config/flake8 ~/config/flake8.bak
mv -f ~/.emacs ~/.emacs.bak
mv -f ~/.emacs.d ~/.emacs.d.bak

#echo '==> After backup:'
#ls ~/.emacs*
sudo cp flake8.conf ~/config/flake8
sudo cp emacs.lisp ~/.emacs
sudo cp -rf emacs.d ~/.emacs.d
chmod 666 ~/.emacs
chmod -R 777 ~/.emacs.d

#echo '==> After adding config files:'
#ls ~/.emacs*
