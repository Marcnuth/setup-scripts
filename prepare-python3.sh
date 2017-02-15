
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
