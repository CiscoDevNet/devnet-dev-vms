# These commands will need to executed manually as part of the base box set up.
# Starting with a Ubuntu 14.04 LTS Desktop based VM, created with a
# "vagrant/vagrant" user, configure vagrant user and add ssh keys appropriately.

# Note that the instructions below require that one execute visudo as root
# which means that the root user needs to be enabled.
# http://askubuntu.com/questions/44418/how-to-enable-root-login
sudo passwd root
sudo passwd -u root 
# Then, once done, disable root
sudo passwd -l root

# In the instructions for allowing passwordless sudo described in the skoblenick
# post below, this line needs to come last in the file:
# vagrant ALL=NOPASSWD: ALL
# http://askubuntu.com/questions/239432/enable-passwordless-sudo-as-a-specific-user

# https://www.skoblenick.com/vagrant/creating-a-custom-box-from-scratch/
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
