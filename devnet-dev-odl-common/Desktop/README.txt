Welcome to the Cisco DevNet Developer machine for the OpenDaylight (ODL) project!

http://www.opendaylight.org/

This Developer machine has been created as a tool to help developers understand and use the ODL technology. We have done our best to create something that will be useful and relevant, and we would appreciate your feedback on our efforts. Any questions, thoughts, thanks, congratulations and so on should be sent to devnet-developer-tools@cisco.com. You don´t ask, you don´t get :-)

On this machine you will find all of the tools, utilities and code you will need to build and explore ODL and the ODL based Cisco Open SDN Controller (COSC), which is Cisco´s commercial distribution of ODL.

See https://developer.cisco.com/site/openSDN/ for further information.

This version of the Developer machine is configured to build the Lithium release of ODL. You are perfectly free to use it for other purposes of course. Look for other versions of this machine for other versions of ODL at https://communities.cisco.com/community/developer/dev-vm/blog/2015/06/23/the-devnet-opendaylight-odl-dev-vm.

What Next?
---------

The instructions below describe how to, either, build ODL, OR download a distribution bundle, and then how to start ODL. 

Clone and Build ODL and Tutorials
---------------------------

This VM is shipped WITHOUT a populated ~/.m2/repository or git projects. The Clone and Build ODL and Tutorials script automates the process of cloning ODL, ODL tutorials and COSC learning labs code, and running the Maven build for the "integration" component. This script can take hours to run, so think about letting it do so whilst you have a good lunch.

The Learning Labs Code
-------------------

The DevNet Learning labs project for ODL and COSC is https://github.com/CiscoDevNet/cosc-learning-labs. You can use that code to help you understand how to use the REST APIs for ODL, and how to access the various options that Cisco DevNet supports for exploring ODL.

Using the Build Bundle
------------------

Building ODL does take some time, and exposes you to the vagaries of a changing code base (this *is* an open source project, and is under constant development, will all the (dis)advantages that this implies in terms of stability and latest features). If you want to do that anyway, read the sections after this one.

If you just want to run ODL, then you can get a pre-built distribution from the download page at the OpenDaylight site:

http://www.opendaylight.org/software/downloads

By default, files are saved into the ~/Downloads directory. These instructions assume that you then move the saved files to the ~/Desktop directory (just so that you can easily use the GUI menus for some of the following steps, and so that it is easy to see what you have installed):

$ cd ~/Downloads
$ mv distribution* ../Desktop

Then there will be a .tar.gz bundle of ODL on the desktop. You can unbundle and run that as follows:

 - Bring up the context menu (typically with the right mouse button) on the file icon on the Desktop, and select "Extract Here", if you are happy to have the code reside in the ~/Desktop directory, or "Open With Archive Manager", if you want to extract the contents to another location. It really does not matter where you put the contents of the bundle. Note that you can also just use the "tar xf <bundle_file_name> command at the CLI.

 - Wherever you extracted the contents of the bundle file to, we will call ODL_DIR below.

 - Open up a terminal with "Ctrl-Alt-t", which will open a Gnome Terminal.

 - In the terminal change directory to the ODL_DIR/bin, e.g. cd ~/Desktop/distribution-karaf-0.3.0-Lithium/bin.

Starting and Stopping ODL
---------------------

ODL is started via Karaf, which loads features defined in the org.apache.karaf.features.cfg file if you use the start scripts, or defined manually via the karaf CLI, if you use the karaf CLI directly.

If you built ODL from source, then your ODL_DIR is ~/git/odl-lithium/integration/karaf/opendaylight-karaf/target/assembly, and so the .cfg file is in ~/git/odl-lithium/integration/karaf/opendaylight-karaf/target/assembly/etc.

If you used the bundle method, then your ODL_DIR is (version depending) ~/Desktop/distribution-karaf-0.3.0-Lithium and the .cfg file is in the ~/Desktop/distribution-karaf-0.3.0-Lithium/etc directory.

A peer of the etc directory, ../bin, contains scripts to run karaf itself, so that you can use the karaf CLI, or start karaf and have it load the features defined in the org.apache.karaf.features.cfg file. There are also stop and status scripts in the bin dir.

So, perhaps having had your lunch whilst ODL was building (and perhaps enjoyed a siesta also) you can return to this VM and:

$ cd $ODL_DIR/bin
$ ./karaf

...

Hit '<tab>' for a list of available commands
and '[cmd] --help' for help on a specific command.
Hit '<ctrl-d>' or type 'system:shutdown' or 'logout' to shutdown OpenDaylight.

opendaylight-user@root>

At the prompt above, you will need to enter the following, where the feature list will vary according to your needs:

opendaylight-user@root>feature:install odl-mdsal-broker odl-restconf odl-yangtools-models odl-dlux-core odl-mdsal-apidocs odl-netconf-all odl-openflowjava-protocol odl-openflowplugin-all odl-netconf-connector-ssh odl-bgpcep-bgp-all odl-bgpcep-pcep-all

The feature list shown here is from the cosc.cfg file on the desktop, which contains configuration for a feature set roughly analogous to that of Cisco's Open SDN Controller.

Also on the Desktop are a number of shortcuts to help automate starting, stopping, and checking the status of the built version of ODL. The "Start ODL with COSC Features" shortcut will copy the cosc.cfg file from the Desktop to the org.apache.karaf.features.cfg file in the etc directory for the built assembly, and then start ODL. The Stop and Status scripts will stop the running instance of ODL and check the status of the running instance.

Note that it is possible to start ODL twice, in which case you will need to use "ps -eaf | grep java" to get the process number of the running java process, and then "kill -9 <process number>" to kill it.

Once ODL has been started, and it can take a while, open the Chrome browser from the desktop icon, and click on the "RestConf Documentation". The login credentials are "admin/admin", if you are prompted for them.  When you see all of the bottom part of the web page populated with a list of APIs, then ODL has started. If not, wait a bit and then refresh the page.

You can also see the DLUX UI by using one of the bookmarks in the Chrome browser.

What to do when the disk fills up
--------------------------

If you build ODL on a regular basis, you will likely fill the Maven repository with "snapshots". Additionally, the projects in the git directory, if all built at once, can use up a lot of disk space. Since ODL is a growing project, how much exactly varies over time. It is likely that the machine disk will fill up if you try to build everything though.

At the start of the Build ODL script, the snapshots in the Maven repository are deleted to save space.

To save even more space, you can "rm -rf" the ~/.m2/repository directory. This will mean, though, that when you build the next time, the Maven repository will have to be re-populated, which will take some time (hours). 

At the end of the script is a command that will find every Maven pom.xml and run a "clean" build, to remove all of the build artefacts. This is not run by default, so you have to copy it and run it yourself in the git directory if you think you need to.

Contents
--------

The contents of this machine are defined in the README files on the Desktop of this machine, and in this file:

https://github.com/CiscoDevNet/devnet-dev-vms/blob/master/devnet-dev-base-common/README-base.txt
