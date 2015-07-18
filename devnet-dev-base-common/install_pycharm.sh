#!/bin/bash
WGET_OPTS=
wget=/usr/bin/wget
PYCHARM_VER=1.0.1
PYCHARM_URL_BASE="http://download-cf.jetbrains.com/python"
PYCHARM_BUNDLE="pycharm-educational-${PYCHARM_VER}.tar.gz"
PYCHARM_INSTALL_DIR_BASE=/usr/local
PYCHARM_DIR=pycharm
PYCHARM_INSTALL_DIR=${PYCHARM_INSTALL_DIR_BASE}/${PYCHARM_DIR}
TMP_DIR=~vagrant/tmp

mkdir -p ${TMP_DIR}

cd ${TMP_DIR}
$wget ${WGET_OPTS} "${PYCHARM_URL_BASE}/${PYCHARM_BUNDLE}"

rm -rf ${PYCHARM_INSTALL_DIR}
mv -f ${PYCHARM_BUNDLE} ${PYCHARM_INSTALL_DIR_BASE}
cd ${PYCHARM_INSTALL_DIR_BASE}
tar xf ${PYCHARM_BUNDLE}
mv -f pycharm-edu-${PYCHARM_VER} ${PYCHARM_DIR}
rm ${PYCHARM_BUNDLE}
cp ${PYCHARM_INSTALL_DIR}/bin/pycharm.png /usr/share/pixmaps/pycharm.png
