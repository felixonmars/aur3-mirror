#!/bin/bash
#
# AUTARCHY: a script to create a tarball including all files required by the PKGBUILD
# 
# by Alessio 'mOLOk' Bolognino

ver=0.3
software=${1%/}  

usage(){
echo -e "\nusage: \t`basename $0` \"software\"\n"
echo -e "\t\"software\" must be a directory including"
echo -e "\tthe PKGBUILD and all the files."
}

if [ $# != 1 ]; then
    echo "ERROR: Wrong number of parameters" 1>&2
    usage
    exit -2
fi

if [[ ! -d  $1 ]]; then 
    echo "ERROR: $1: No such directory" 1>&2
    usage
    exit -1
fi

lsfiles(){
    source $software/PKGBUILD
    for file in ${source[@]}; do
    	echo $software/$file | grep  -v '://'
    done
    if [ x$install != x ]; then echo $software/$install; fi
    if [ -r $software/ChangeLog  ]; then echo $software/ChangeLog; fi
}
echo -e "${software}.tar.gz includes:\n\n$software/PKGBUILD \n`lsfiles $software`\n "
tar cfz ${software}.tar.gz  $software/PKGBUILD `lsfiles $software` && echo 'done! :)' || echo 'failed :('
