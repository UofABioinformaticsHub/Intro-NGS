#!/bin/bash -l

# setup directories
cd ~/
mkdir ngs_workshop
wget
tar xvzf IntroToNGS_data.tar.gz

# Install java and fastQC
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install fastx-toolkit

wget https://launchpad.net/ubuntu/+archive/primary/+files/fastqc_0.11.5+dfsg-3_all.deb
sudo dpkg -i fastqc_0.11.5+dfsg-3_all.deb
sudo apt-get install -f
rm fastqc_0.11.5+dfsg-3_all.deb

# Install Sabre and add to PATH
cd /opt/local; sudo git clone https://github.com/najoshi/sabre.git; cd sabre; sudo make
echo 'export PATH=$PATH:/opt/local/sabre' >> ~/.bashrc
