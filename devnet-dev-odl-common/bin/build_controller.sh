#! /bin/bash

echo ***!!! This script will delete and rebuild everything. That will take hours. Are you sure you want to do that? !!!***

read -p "If so, press any key to continue... " -n1 -s


# Create directories for ODL build for the cisco-devnet user
mkdir -p /home/cisco-devnet/git/odl-lithium
# Start by remiving all snapshots to save space
find . -name "*SNAPSHOT*" -print -exec rm -rf {} \;
mkdir -p  /home/cisco-devnet/.m2

# Update Maven settings
cd /home/cisco-devnet/.m2
wget -q -O - https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml > settings.xml
   
# Anonymous git clone for all ODL projects, based on 
# https://wiki.opendaylight.org/view/GettingStarted:Pulling,_Hacking,_and_Pushing_All_the_Code_from_the_CLI
# Repeat this twice as falures are common.
cd /home/cisco-devnet/git/odl-lithium
# for PROJECT in aaa affinity bgpcep controller defense4all dlux docs groupbasedpolicy integration l2switch lispflowmapping odlparent opendove openflowjava openflowplugin opflex ovsdb packetcable releng/autorelease releng/builder reservation sdninterfaceapp sfc snbi snmp4sdn tcpmd5 toolkit ttp vtn yangtools; do git clone https://git.opendaylight.org/gerrit/${PROJECT}.git ${PROJECT}; done
# for PROJECT in aaa affinity bgpcep controller defense4all dlux docs groupbasedpolicy integration l2switch lispflowmapping odlparent opendove openflowjava openflowplugin opflex ovsdb packetcable releng/autorelease releng/builder reservation sdninterfaceapp sfc snbi snmp4sdn tcpmd5 toolkit ttp vtn yangtools; do git clone https://git.opendaylight.org/gerrit/${PROJECT}.git ${PROJECT}; done

# A subset to save space
for PROJECT in bgpcep controller dlux odlparent openflowjava openflowplugin tcpmd5 yangtools integration; do git clone https://git.opendaylight.org/gerrit/${PROJECT}.git ${PROJECT}; done

# In case the code had already been cloned, do a git pull to make sure it is all up to date
cd /home/cisco-devnet/git/odl-lithium
for PROJECT in bgpcep controller dlux odlparent openflowjava openflowplugin tcpmd5 yangtools integration; do cd ${PROJECT}; git pull; cd /home/cisco-devnet/git/odl-lithium; done

# Git checkout stable branch for lithium (TODO revist when the stable branch exists after release)
# for PROJECT in bgpcep controller integration odlparent tcpmd5 yangtools; do cd ${PROJECT}; git checkout stable/lithium; cd /home/cisco-devnet/git/odl-lithium; done

# Run Maven build and create Eclipse project files. We just need to build
# Controller to get the features we need.
for PROJECT in controller; do cd ${PROJECT}; mvn -fn -nsu clean eclipse:eclipse install -D skipTests; cd /home/cisco-devnet/git/odl-lithium; done
cd /home/cisco-devnet/git/odl-lithium

# Import projects to Eclipse workspace (it would be nice if this did work, but it does not. TBD)
# mkdir -p /home/cisco-devnet/workspace
# /usr/local/eclipse-jee/eclipse -nosplash -data /home/cisco-devnet/workspace -application org.eclipse.cdt.managedbuilder.core.headlessbuild -importAll /home/cisco-devnet/git/odl-lithium

# Git clone the COSC Learning Labs
cd /home/cisco-devnet/git
git clone http://gerrit-open1.cisco.com/gerrit/p/cosc-learning-labs

# Git clone the ODL core tutorials
cd /home/cisco-devnet/git
git clone https://git.opendaylight.org/gerrit/p/coretutorials.git
    
# Build core tutorials
cd /home/cisco-devnet/git/coretutorials
# mvn -fn -nsu clean eclipse:eclipse install

# The build from top level does not seem to work reliably, so go into each chapter and build each one seperately
find . -name pom.xml -exec mvn clean install -fn -nsu -f {} \; 

# Clean up projects to save space
# cd /home/cisco-devnet/git
# find . -name pom.xml -exec mvn clean -fn -f -nsu {} \; 
read -p "Press any key to continue... " -n1 -s



