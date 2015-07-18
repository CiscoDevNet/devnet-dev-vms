#!/bin/bash
# Add the cisco-devnet user and add to sudoers.

addgroup cisco-devnet

# http://askubuntu.com/questions/94060/run-adduser-non-interactively
adduser --gecos "" --disabled-login --shell /bin/bash --ingroup cisco-devnet cisco-devnet

# http://serverfault.com/questions/336298/can-i-change-a-user-password-in-linux-from-the-command-line-with-no-interactivit
echo "cisco-devnet:CISCO-DEVNET" | sudo chpasswd

# http://askubuntu.com/questions/7477/how-can-i-add-a-new-user-as-sudoer-using-the-command-line
usermod -a -G sudo cisco-devnet
