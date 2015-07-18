#!/bin/bash
WGET_OPTS=
wget=/usr/bin/wget
INTELLIJ_URL_BASE="https://d1opms6zj7jotq.cloudfront.net/idea"
INTELLIJ_BUNDLE="ideaIC-14.1.4.tar.gz"
INTELLIJ_INSTALL_DIR_BASE=/usr/local
INTELLIJ_DIR=idea
INTELLIJ_INSTALL_DIR=${INTELLIJ_INSTALL_DIR_BASE}/${INTELLIJ_DIR}
TMP_DIR=~vagrant/tmp

mkdir -p ${TMP_DIR}

cd ${TMP_DIR}
$wget ${WGET_OPTS} "${INTELLIJ_URL_BASE}/${INTELLIJ_BUNDLE}"

rm -rf ${INTELLIJ_INSTALL_DIR}
mv -f ${INTELLIJ_BUNDLE} ${INTELLIJ_INSTALL_DIR_BASE}
cd ${INTELLIJ_INSTALL_DIR_BASE}
tar xf ${INTELLIJ_BUNDLE}
mv -f idea-IC-14* ${INTELLIJ_DIR}
rm ${INTELLIJ_BUNDLE}
cp ${INTELLIJ_INSTALL_DIR}/bin/idea.png /usr/share/pixmaps/idea.png
