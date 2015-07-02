# Rotate and cleanup log files
sudo /etc/cron.daily/logrotate
sudo find /var/log -type f -name "*.gz" -exec rm -f {} \;
sudo find /var/log -type f -name "*.1" -exec rm -f {} \;
sudo find /var/log -type f -name "*.old" -exec rm -f {} \; 
