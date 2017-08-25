#!/bin/bash -l

# setup data and directories
cd ~/; \
wget -qO- "https://universityofadelaide.box.com/shared/static/5jhhdivfcl2odivqlumxgjwyh1agkvvi.gz" | tar xvz

# Install java and fastQC
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install fastx-toolkit

# Install new version of FastQC
wget https://launchpad.net/ubuntu/+archive/primary/+files/fastqc_0.11.5+dfsg-3_all.deb
sudo dpkg -i fastqc_0.11.5+dfsg-3_all.deb
sudo apt-get install -f
rm fastqc_0.11.5+dfsg-3_all.deb

# Install Sabre and add to PATH
cd /opt/local; sudo git clone https://github.com/najoshi/sabre.git; cd sabre; sudo make
echo 'export PATH=$PATH:/opt/local/sabre' >> ~/.bashrc
