# Zero disk space
sudo dd if=/dev/zero of=/zero.file bs=10M count=999999999
sudo rm /zero.file
