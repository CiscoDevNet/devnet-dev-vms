#!/bin/bash
# Move provisioned files into place and set ownership and permissions
mkdir -p ~cisco-devnet/Desktop
mkdir -p ~cisco-devnet/bin
mv ~vagrant/Desktop/*.desktop ~cisco-devnet/Desktop
mv ~vagrant/Desktop/README ~cisco-devnet/Desktop
chown -Rf cisco-devnet:cisco-devnet ~cisco-devnet
chmod o+rwx ~cisco-devnet/Desktop/*.desktop
