
# python & packages
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-setuptools
sudo apt-get -y install python3-tk
sudo apt-get -y install python3-mysqldb
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
sudo pip3 install -U statsmodels
sudo ./prepare-xgboost.sh

# others
sudo pip3 install --upgrade docopt
sudo pip3 install --upgrade rope
sudo pip3 install --upgrade jedi
sudo pip3 install --upgrade flake8
sudo pip3 install --upgrade importmagic
sudo pip3 install --upgrade autopep8
sudo pip3 install --upgrade yapf
sudo pip3 install --upgrade ipdb
sudo pip3 install --upgrade pdb
ln -sf /usr/local/bin/ipdb3 /usr/local/bin/ipdb 

sudo pip3 install ConfigParser
sudo pip3 install mysql-python
