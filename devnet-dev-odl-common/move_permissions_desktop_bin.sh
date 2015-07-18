# Move provisioned files into place and set ownership and permissions
sudo mv ~vagrant/bin/*.sh ~cisco-devnet/bin
sudo chmod o+rwx ~cisco-devnet/bin/*.sh
sudo mv ~vagrant/Desktop/*.desktop ~cisco-devnet/Desktop
sudo mv ~vagrant/Desktop/README ~cisco-devnet/Desktop
sudo mv ~vagrant/Desktop/cosc.cfg ~cisco-devnet/Desktop/cosc.cfg
sudo chown -Rf cisco-devnet:cisco-devnet ~cisco-devnet
sudo chmod o+rwx ~cisco-devnet/Desktop/*.desktop
sudo mv ~vagrant/Chrome_Bookmarks ~cisco-devnet/.config/google-chrome/Default/Bookmarks
sudo chown cisco-devnet ~cisco-devnet/.config/google-chrome/Default/Bookmarks
sudo chmod o+rwx ~cisco-devnet/.config/google-chrome/Default/Bookmarks
