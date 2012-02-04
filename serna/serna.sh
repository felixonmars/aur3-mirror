#!/bin/sh 

inst_prefix=/opt
SERNA_DATA_DIR=${inst_prefix}/serna-free-pkgver
LD_LIBRARY_PATH=${inst_prefix}/serna-free-pkgver/bin:${inst_prefix}/serna-free-pkgver/lib:${inst_prefix}/serna-free-pkgver/python/lib:${LD_LIBRARY_PATH}

if [ x${AXF4_HOME} = x ]; then
    AXF4_HOME=/usr/XSLFormatterV4
fi

if [ -e ${AXF4_HOME}/lib/libXfoInterface.so ]; then
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${AXF4_HOME}/lib
fi

AXF4_LIB_FOLDER=${AXF4_HOME}/lib
AXF4_BIN_FOLDER=${AXF4_HOME}/bin
AXF4_ETC_FOLDER=${AXF4_HOME}/etc
AXF4_SDATA_FOLDER=${AXF4_HOME}/sdata

if [ x${AXF4_FONT_CONFIGFILE} = x ]; then
    [ -f ${AXF4_ETC_FOLDER}/font-config.xml ] && AXF4_FONT_CONFIGFILE=${AXF4_ETC_FOLDER}/font-config.xml
    export AXF4_FONT_CONFIGFILE
fi

AXF4_LIC_PATH=${AXF4_ETC_FOLDER}
AXF4_HYPDIC_PATH=${AXF4_ETC_FOLDER}/hyphenation
AXF4_DMC_TBLPATH=${AXF4_SDATA_FOLDER}/base2

export AXF4_LIC_PATH AXF4_HYPDIC_PATH AXF4_DMC_TBLPATH

JAVA_HOME=${SERNA_DATA_DIR}/jre
export JAVA_HOME

export SERNA_DATA_DIR
export LD_LIBRARY_PATH

exec ${inst_prefix}/serna-free-pkgver/bin/serna.bin "$@"
