sudo apt-get install -y git
sudo apt-get install -y emacs

sudo rm -rf ~/.emacs.d.bak 2> /dev/null
sudo mv ~/.emacs.d ~/.emacs.d.bak 2> /dev/null
sudo git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

sudo chown -R ${USER}:${GROUP} ~/.emacs.d
