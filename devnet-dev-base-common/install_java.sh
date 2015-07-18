#!/bin/bash
# Install JRE and JDK
# http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html

add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default
