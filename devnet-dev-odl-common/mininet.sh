# Install Mininet
sudo mkdir -p /home/cisco-devnet/git/mininet-packages
cd /home/cisco-devnet/git/mininet-packages
sudo git clone git://github.com/mininet/mininet
cd mininet
sudo git checkout -b 2.2.1d2 2.2.1d2
sudo util/install.sh -a
sudo chown -R cisco-devnet /home/cisco-devnet/git
