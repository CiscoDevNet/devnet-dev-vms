# Upping the Boxes

The boxes we have packaged here are available in Atlas at these links:

https://atlas.hashicorp.com/CiscoDevNet/boxes/devnet-dev-base-vmware
https://atlas.hashicorp.com/CiscoDevNet/boxes/devnet-dev-base-vbox

## Vagrantfiles

To "up" a box, one needs a Vagrantfile. Vagrantfiles are provided in this project, or one can use "vagrant init ..." to create a Vagrantfile, as below, where the name of the base box can be either "devnet-dev-base-vmware" or "devnet-dev-base-vbox":

```bash
$ vagrant init CiscoDevNet/devnet-dev-base-[vbox|vmware]
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```

The main reason to use the provided Vagrantfiles is that there is a lot of processing (software install and update,  various maintenance tasks, and so on) that should take place when one "ups" a box, all of which is in the provided Vagrantfiles and associated scripts.

The provided files are here:

[Vagrantfile for the VBox version](devnet-dev-base-vbox/Vagrantfile)

[Vagrantfile for the VMware version](devnet-dev-base-vmware/Vagrantfile)

The provided Vagrantfiles have a section like this:

``` python
  # This version uses the box in the Atlas catalogue
  # config.vm.box = "CiscoDevNet/devnet-dev-base-vbox"
  # This version uses the local definition of the box
  # config.vm.box = "devnet-dev-base-vbox"
```

As the comments say, the first "config.vm.box" statement uses, and so would cause to be downloaded, a box from the Atlas catalogue in the [CiscoDevNet project](https://atlas.hashicorp.com/CiscoDevNet). The Atlas box is what one would use under normal circumstances.

The second option would use a local box, which is typically only used when one is modifying and testing boxes locally, prior to upload to Atlas.

## VirtualBox

Before using the VBox VM, install the [vbguest plugin](https://github.com/dotless-de/vagrant-vbguest), like this:

```bash
vagrant plugin install vagrant-vbguest
Installing the 'vagrant-vbguest' plugin. This can take a few minutes...
Installed the plugin 'vagrant-vbguest (0.10.0)'!
```

Note that an error might occur, in which case one can just try again.

## The "vagrant up ..." Command

The general pattern of the command to up a box (given a Vagrantfile in the current directory) is below. The "provider" argument should be *one* of [virtualbox|vmware\_fusion|vmware\_workstation], where virtualbox is generic for all platforms that support that provider, vmware\_fusion is for Mac OS X, and vmware\_workstation is for Windows. Note that the provider when adding a box to Atlas is "vmware_desktop".

The name of the base box can be either "devnet-dev-base-vmware" or "devnet-dev-base-vbox"

Bring up a local box would look like this:

```bash
$ vagrant up --provider=virtualbox|vmware_fusion|vmware_workstation
Bringing machine 'default' up with 'virtualbox|vmware_fusion|vmware_workstation' provider...
==> default: Importing base box 'devnet-dev-base-vbox|vmware'...
```

Bringing up a box from Atlas would look like this:

```bash
vagrant up --provider=virtualbox|vmware_fusion|vmware_workstation
Bringing machine 'default' up with ' virtualbox|vmware_fusion|vmware_workstation' provider...
==> default: Box 'CiscoDevNet/devnet-dev-base-vbox|vmware' could not be found. Attempting to find and install...
    default: Box Provider:  virtualbox|vmware_fusion|vmware_workstation
    default: Box Version: >= 0
==> default: Loading metadata for box 'CiscoDevNet/devnet-dev-base-vbox|vmware'
    default: URL: https://atlas.hashicorp.com/CiscoDevNet/devnet-dev-base-vbox|vmware
==> default: Adding box 'CiscoDevNet/devnet-dev-base-vbox|vmware' (v0.0.1) for provider: virtualbox|vmware_fusion|vmware_workstation
    default: Downloading: https://atlas.hashicorp.com/CiscoDevNet/boxes/devnet-dev-base-vbox|vmware/versions/0.0.1/providers/virtualbox|vmware_desktop.box
    default: Progress: 0% (Rate: 1258k/s, Estimated time remaining: 1:03:50)
```
