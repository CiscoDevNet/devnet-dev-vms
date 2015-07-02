# Install Mininet
cd /home/cisco-devnet/git
sudo mkdir mininet
cd mininet
sudo git clone git://github.com/mininet/mininet
cd mininet
sudo git checkout -b 2.2.1d2 2.2.1d2
cd ..
sudo mininet/util/install.sh -a
