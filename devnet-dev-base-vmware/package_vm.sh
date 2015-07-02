cd ~/Documents/Virtual\ Machines.localized/Cisco-DevNet-DevVM-Base-Vagrant-VMware.vmwarevm
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -d Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -k Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
rm *.plist
rm *.log
tar cvzf devnet-dev-base-vmware.box ./*
vagrant box add --force --name devnet-dev-base-vmware devnet-dev-base-vmware.box 

rm -rf .vagrant
vagrant up --provider=vmware_fusion

https://brianfisher.name/content/reinstall-vmware-tools-vagrant-vmware-fusion-virtual-machine-command-line
