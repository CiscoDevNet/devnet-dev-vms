#!/bin/bash
apt-get install wireshark -y
groupadd wireshark
usermod -a -G wireshark cisco-devnet
chgrp wireshark /usr/bin/dumpcap
chmod 750 /usr/bin/dumpcap
setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
