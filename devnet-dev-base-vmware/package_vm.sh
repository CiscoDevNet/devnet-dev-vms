# These file shows commands and notes that illustrate the how to package a VMware
# VM. This has to be done manually as Vagrant does not package VMware VMs
# automatically. Packer possibly does.
#
# The first set of commands are for packaing a VM in the default VMware Fusion
# location. The second set of commands is for packing a VM that has been up'ed.
# As the base VMs are evolved, it is the second set of commands that see most
# use.
cd ~/Documents/Virtual\ Machines.localized/Cisco-DevNet-DevVM-Base-Vagrant-VMware.vmwarevm
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -d Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -k Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
rm *.plist
rm *.log
rm -rf *.lck
tar cvzf devnet-dev-base-vmware.box ./*
mv devnet-dev-base-vmware.box ~/Downloads

# The same commands, but for the bx in motion, as it were, after it has been
# shutdown. Note that, in recreating a base box from a box derived from a base
# box, you will be creating a box that does not have the well known insecure
# public SSH ley.
# The auto-generated-box-ID below could look like
# d22d6823-9eae-42d5-90a1-9a95bd80324e.
cd ~git/devnet-dev-vms/devnet-dev-base-vmware/.vagrant/machines/default/vmware_fusion/[auto-generated-box-ID]

/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -d Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -k Cisco-DevNet-DevVM-Base-Vagrant-VMware-disk1-cl1.vmdk
rm *.plist
rm *.log
rm -rf *.lck
tar cvzf devnet-dev-base-vmware.box ./*
mv devnet-dev-base-vmware.box ~/Downloads

# Having packaged the box, and moved it to downloads, it needs to be added as a
# local box for testing.
cd ~/Downloads
vagrant box add --force --name devnet-dev-base-vmware devnet-dev-base-vmware.box 
# cd ~/git/devnet-dev-vms/devnet-dev-base-vmware
# cd ~/git/devnet-dev-vms/devnet-dev-odl-vmware

# Remove any traces of a previous box.
# Remember to change Vagrantfile to point to local box.
rm -rf .vagrant
vagrant up --provider=vmware_fusion

https://brianfisher.name/content/reinstall-vmware-tools-vagrant-vmware-fusion-virtual-machine-command-line
