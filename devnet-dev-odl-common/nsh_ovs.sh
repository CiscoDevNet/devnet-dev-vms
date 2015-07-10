# Install the NSH OVS implementation
# https://docs.google.com/document/d/18xK9vL-lcfwuV3Bc7yayC00wC47oGIDDs8Z72SZz9SA/edit#
sudo mkdir -p /home/cisco-devnet/git/nsh_ovs
cd /home/cisco-devnet/git/nsh_ovs
sudo curl https://raw.githubusercontent.com/priteshk/ovs/nsh-v8/third-party/start-ovs.sh | bash
sudo chown -R cisco-devnet /home/cisco-devnet/git

