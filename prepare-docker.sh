
# docker
which docker
if [ $? -ne 0 ]; then
    # https://docs.docker.com/engine/installation/linux/ubuntulinux/
    sudo apt -y install apt-transport-https ca-certificates
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt update
    sudo apt-get -y install docker-engine
    sudo apt-get -y install aufs-tools
    sudo service docker start
    sudo groupadd docker
    sudo usermod -aG docker $USER
fi
echo '=> Docker is installed'

docker pull sequenceiq/hadoop-docker:2.7.1
docker pull sequenceiq/spark:1.6.0


