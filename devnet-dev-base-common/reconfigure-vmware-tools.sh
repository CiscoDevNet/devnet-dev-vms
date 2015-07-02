# Reconfigure VMware tools after software update 
sudo service vmware-tools stop
cd /home/vagrant/vmware-tools-distrib/bin 
sudo ./vmware-config-tools.pl -d
sudo service vmware-tools restart
