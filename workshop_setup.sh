#!/bin/bash -l

# setup data and directories
cd /home/hub/; \
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

# Install Sabre and bwa and add to PATH
cd /opt/; sudo git clone https://github.com/najoshi/sabre.git; cd sabre; sudo make

cd /opt/; sudo wget https://github.com/lh3/bwa/releases/download/v0.7.16/bwa-0.7.16a.tar.bz2; sudo tar xvjf bwa-0.7.16a.tar.bz2; cd bwa-0.7.16a; sudo make

# This doesnt seem to execute?
sudo echo 'export PATH=$PATH:/opt/bwa-0.7.16a:/opt/sabre' >> /home/hub/.bashrc

# Install cutadapt
sudo pip install cutadapt
