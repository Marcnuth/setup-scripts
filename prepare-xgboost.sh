python3 -c "import xgboost"
if [ $? -ne 0 ]; then
    rm -rf /usr/bin/xgboost/
    git clone --recursive https://github.com/dmlc/xgboost /usr/bin/xgboost/
    cd /usr/bin/xgboost/
    make -j4
    cd python-package
    sudo python3 setup.py install
    
    echo 'export PYTHONPATH=/usr/bin/xgboost/python-package' >> /etc/profile
fi
echo '=> XGBoost is installed'

