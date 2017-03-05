
# prepare node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y nodejs

# prepare ionic
npm install -g ionic cordova

# prepare java

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz -O /tmp/jdk8.tar.gz 


# prepare android
wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip -O /tmp/android_studio.zip
