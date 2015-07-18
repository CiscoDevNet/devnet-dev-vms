#!/bin/bash
# Rotate and cleanup log files
/etc/cron.daily/logrotate
find /var/log -type f -name "*.gz" -exec rm -f {} \;
find /var/log -type f -name "*.1" -exec rm -f {} \;
find /var/log -type f -name "*.old*" -exec rm -f {} \; 
