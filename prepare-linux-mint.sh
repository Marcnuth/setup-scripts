sudo apt-get update

sudo ./prepare-python3.sh

# emacs
sudo ./prepare-emacs.sh


# zsh
which zsh
if [ $? -ne 0 ]; then
    sudo apt-get -y install zsh
    sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo '=> ZSH is installed'
mv -f ~/.zshrc ~/.zshrc.bak
cp zsh.conf ~/.zshrc
chmod 666 ~/.zshrc

# tmux
which tmux
if [ $? -ne 0 ]; then
    sudo apt-get -y install tmux
fi
echo '=> Tmux is installed'
mv -f ~/.tmux.conf ~/.tmux.conf.bak
cp tmux.conf ~/.tmux.conf
chmod 666 ~/.tmux.conf

# docker
sudo ./prepare-docker.sh

# parepare fonts
# https://gist.github.com/rogerleite/99819
