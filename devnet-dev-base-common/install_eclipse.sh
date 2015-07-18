#!/bin/bash

# Install Eclipse
WGET_OPTS=
wget=/usr/bin/wget
ECLIPSE_URL_BASE="http://download.eclipse.org/technology/epp/downloads/release/mars/R/"
ECLIPSE_BUNDLE="eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz"
ECLIPSE_INSTALL_DIR_BASE=/usr/local
ECLIPSE_DIR=eclipse-jee
ECLIPSE_INSTALL_DIR=${ECLIPSE_INSTALL_DIR_BASE}/${ECLIPSE_DIR}
TMP_DIR=~vagrant/tmp

mkdir -p ${TMP_DIR}

cd ${TMP_DIR}
$wget ${WGET_OPTS} "${ECLIPSE_URL_BASE}/${ECLIPSE_BUNDLE}"

rm -rf ${ECLIPSE_INSTALL_DIR}
mv -f ${ECLIPSE_BUNDLE} ${ECLIPSE_INSTALL_DIR_BASE}
cd ${ECLIPSE_INSTALL_DIR_BASE}
tar xf ${ECLIPSE_BUNDLE}
mv -f eclipse ${ECLIPSE_DIR}
rm ${ECLIPSE_BUNDLE}

# Install PyDev - http://pydev.org/
PYDEV_VER=4.2.0
PYDEV_URL="http://freefr.dl.sourceforge.net/project/pydev/pydev/PyDev ${PYDEV_VER}"
PYDEV_BUNDLE="PyDev ${PYDEV_VER}.zip"

cd ${TMP_DIR}
$wget ${WGET_OPTS} "${PYDEV_URL}/${PYDEV_BUNDLE}"
unzip "${PYDEV_BUNDLE}"
mv -f features ${ECLIPSE_INSTALL_DIR}/dropins
mv -f plugins ${ECLIPSE_INSTALL_DIR}/dropins
rm "${PYDEV_BUNDLE}"

# Install http://bcsw.net/YangEclipsePlugIn
PYANG_VER=1.0.3
PYANG_URL=http://bcsw.net/plugins
PYANG_BUNDLE=yang-editor_${PYANG_VER}.jar

cd ${TMP_DIR}
$wget ${WGET_OPTS} "${PYANG_URL}/${PYANG_BUNDLE}"
mv -f "${PYANG_BUNDLE}" ${ECLIPSE_INSTALL_DIR}/dropins
