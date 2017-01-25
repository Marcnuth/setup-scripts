sudo apt-get update

# emacs
which emacs
if [ $? -ne 0 ]; then
    sudo apt-get -y install emacs
fi
echo '=> Emacs is installed'
mv -f ~/.emacs ~/.emacs.bak
cp emacs.conf ~/.emacs
chmod 666 ~/.emacs


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

# python & packages
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-setuptools
sudo apt-get -y install python3-tk
echo '=> Python3-pip is installed'

# machine learning packages
sudo pip3 install --upgrade pip
sudo pip3 install tqdm
sudo pip3 install numpy
sudo pip3 install scipy
sudo pip3 install pandas
sudo pip3 install -U scikit-learn
sudo pip3 install -U imbalanced-learn
sudo pip3 install matplotlib
sudo pip3 install seaborn
sudo pip3 install tensorflow
sudo pip3 install jupyter
sudo pip3 install -U scikit-image
sudo pip3 install -U pydicom
sudo pip3 install -U keras
sudo pip3 install -U SimpleITK
sudo ./prepare-xgboost.sh

# others
sudo pip3 install docopt
sudo pip3 install rope
sudo pip3 install jedi
sudo pip3 install flake8
sudo pip3 install importmagic
sudo pip3 install autopep8
sudo pip3 install yapf
