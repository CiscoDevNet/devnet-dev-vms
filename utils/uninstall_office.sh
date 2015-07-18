#!/bin/bash

apt-get remove --purge libreoffice*
apt-get clean
apt-get autoremove
apt-get remove fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg
