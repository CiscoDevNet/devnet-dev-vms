#! /bin/bash
set -e
cp /home/cisco-devnet/Desktop/cosc.cfg /home/cisco-devnet/git/odl-lithium/controller/karaf/opendaylight-karaf/target/assembly/etc/org.apache.karaf.features.cfg

nohup /home/cisco-devnet/git/odl-lithium/controller/karaf/opendaylight-karaf/target/assembly/bin/start

echo This script will pause for 30 seconds and then check status
sleep 30

/home/cisco-devnet/git/odl-lithium/controller/karaf/opendaylight-karaf/target/assembly/bin/status

read -p "Press any key to continue... " -n1 -s

