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

rm -rf ~/.config/flake8.bak 2>/dev/null
rm -rf ~/.emacs.bak 2>/dev/null
rm -rf ~/.emacs.d.bak 2>/dev/null

#echo '==> After removed:'
#ls ~/.emacs*
mv -f ~/.config/flake8 ~/.config/flake8.bak 2>/dev/null
mv -f ~/.emacs ~/.emacs.bak 2>/dev/null
mv -f ~/.spacemacs ~/.spacemacs.bak 2>/dev/null
mv -f ~/.emacs.d ~/.emacs.d.bak 2>/dev/null

#echo '==> After backup:'
#ls ~/.emacs*

sudo cp flake8.conf ~/.config/flake8
sudo cp -rf emacs.d ~/.emacs.d
chmod -R 777 ~/.emacs.d

#echo '==> After adding config files:'
#ls ~/.emacs*
