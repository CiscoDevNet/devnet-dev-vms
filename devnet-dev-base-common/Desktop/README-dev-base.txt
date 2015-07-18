Welcome to the Cisco DevNet Developer Base machine!

This Developer machine has been created as a tool to help developers understand and use the Cisco Platform developer technology. We have done our best to create something that will be useful and relevant, and we would appreciate your feedback on our efforts. 

Any questions, thoughts, thanks, congratulations, and so on, should be sent to devnet-developer-tools@cisco.com, or use the support community here: 

https://communities.cisco.com/community/developer/dev-vm. 

You don´t ask, you don´t get :-)

This, base version, of the VM is used as a means to provide a common toolset for further VMs that include platform specific technology covering, for example, the Cisco Open SDN Controller. APIC-EM, ACI, NX-API, Netcong/Yang APIs and so on. See the community at the link above for further details.

Contents
--------

This machine is based on a Ubuntu 14.04.2 LTS Desktop image, with certain packages not required for development, e.g. Libre Office removed to save space. See http://www.ubuntu.com/download/desktop and http://www.ubuntu.com/legal/terms-and-policies/intellectual-property-policy.

References to the "Apache License 2.0" below refer to http://www.apache.org/licenses/LICENSE-2.0.txt.

References to the "Eclipse Public License 1.0" or "EPL 1.0" refer to https://www.eclipse.org/legal/epl-v10.html.

References to the "GNU General Public License, version 2" or "GPL 2" refer to https://www.gnu.org/licenses/gpl-2.0.html. 

Installed on this machine, in addition to the standard Linux developer tools, are:

 - Maven, which is a project build tool used to build OpenDaylight projects and tutorials. Distributed under the Apache License 2.0. See http://maven.apache.org/.
 - Eclipse JEE version, with PyDev and Code Recommenders Tools for Java Developers, as well as settings specific to the m2e plugin and the ODL build. Distributed under the EPL 1.0. See http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/lunasr2
 - IntelliJ IDEA Java IDE, community edition. Distributed under the Apache License 2.0. See https://www.jetbrains.com/idea/
 - PyCharm Python IDE, community edition. Distributed under the Apache License 2.0. See https://www.jetbrains.com/pycharm/
 - Wireshark, which is a tool for "sniffing" network traffic and analysing the contents, very useful for debugging purposes in network infrastructure development. Distributed under the GPL 2. See https://www.wireshark.org/
 - Mininet, which is an OpenFlow switch simulator. Distributed under the Mininet Pre-Beta License, https://github.com/bigswitch/mininet/blob/master/LICENSE. See http://mininet.org/
 - VMMaestro, which is the client GUI for Cisco´s Virtual Internet Routing Laboratory. Based on Eclipse distributed under the EPL 1.0, with additional components copyright Cisco Systems 2014, 2015. See http://virl.cisco.com
 - Google Chrome, with Postman, for accessing REST APIs. Copyright 2015 Google Inc. under these terms of service: https://www.google.com/chrome/browser/privacy/eula_text.html and https://www.getpostman.com/licenses/postman_base_app. See https://www.google.com/chrome/browser/desktop/ and https://www.getpostman.com/
 - PYang developer tools, for working with Yang data models. Distributed under this licence: https://github.com/mbj4668/pyang/blob/master/LICENSE. See https://github.com/mbj4668/pyang and the Eclipse plugin at http://bcsw.net/YangEclipsePlugIn

The source for this README is https://github.com/CiscoDevNet/devnet-dev-vms/blob/master/devnet-dev-base-common/README-dev-base.txt
