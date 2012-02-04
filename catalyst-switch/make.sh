#!/bin/bash

# Copyright 1999-2005 ATI Technologies Inc., Markham, Ontario, CANADA.   
# All Rights Reserved.                                                   
#                                                                        
# Your use and or redistribution of this software in source and \ or     
# binary form, with or without modification, is subject to: (i) your     
# ongoing acceptance of and compliance with the terms and conditions of  
# the ATI Technologies Inc. software End User License Agreement; and (ii)
# your inclusion of this notice in any version of this software that you 
# use or redistribute.  A copy of the ATI Technologies Inc. software End 
# User License Agreement is included with this software and is also      
# available by contacting ATI Technologies Inc. at http://www.ati.com    

# ==============================================================
# External environment variables
#
# FGLRX_DEBUG
# Set this variable to backup kernel module before stripping
# The nonstripped version will be names like fglrx_dbg.ko

# ==============================================================
# local variables and files

current_wd=`pwd`
logfile=$current_wd/make.sh.log	# DKMS uses name 'make.log', so that we need another name
rootcheck=0
MODULE=fglrx
LIBIP_PREFIX=.

# ==============================================================
# sets the GCC to use to the one required by the module (if available)

set_GCC_version () {
  #identify GCC default version major number
  GCC_MAJOR="`gcc --version | grep -o -e ") ." | head -1 | cut -d " " -f 2`"

  #identify the GCC major version that compiled the kernel
  KERNEL_GCC_MAJOR="`cat /proc/version | grep -o -e "gcc version ."  | cut -d " " -f 3`"

  #see if they don't match
  if [ ${GCC_MAJOR} != ${KERNEL_GCC_MAJOR} ]; then
       #use kernel GCC version hopefully
       KERNEL_GCC="`cat /proc/version | grep -o -e "gcc version [0-9]\.[0-9]" | cut -d " " -f 3`"
       CC="gcc-${KERNEL_GCC}"

       # check if gcc version requested exists
       GCC_AVAILABLE="`${CC} --version | grep -e ")" | head -1 | cut -d " " -f 4 | cut -c-3`"
    
       if [ ${GCC_AVAILABLE} != ${KERNEL_GCC} ]; then
           echo "The GCC version that is required to compile this module is version ${KERNEL_GCC}."
           echo "Please install this GCC or recompile your kernel with ${GCC_AVAILABLE}"
           exit 1
       fi
  fi
}

if [ -z "${CC}" ]; then 
	CC=gcc
	set_GCC_version
fi

# ==============================================================
# system/kernel identification

uname_r=`uname -r`
uname_v=`uname -v`
uname_s=`uname -s`
uname_m=`uname -m`
uname_a=`uname -a`

# ==============================================================
# parse options

while [ $# -gt 0 ]; do
    case $1 in
        --rootcheck)
            rootcheck=1
            shift
            ;;
        --nohints)
            OPTIONS_HINTS=0
            shift
            ;;
        --uname_r*)
            if echo $1 | grep '=' >/dev/null ; then
                uname_r=`echo $1 | sed 's/^.*=//'`
            else
                uname_r="$2"
                shift
            fi
            shift
            ;;
        --uname_v*)
            if echo $1 | grep '=' >/dev/null ; then
                uname_v=`echo $1 | sed 's/^.*=//'`
            else
                uname_v="$2"
                shift
            fi
            shift
            ;;
        --uname_s*)
            if echo $1 | grep '=' >/dev/null ; then
                uname_s=`echo $1 | sed 's/^.*=//'`
            else
                uname_s="$2"
                shift
            fi
            shift
            ;;
        --uname_m*)
            if echo $1 | grep '=' >/dev/null ; then
                uname_m=`echo $1 | sed 's/^.*=//'`
            else
                uname_m="$2"
                shift
            fi
            shift
            ;;
        --uname_a*)
            if echo $1 | grep '=' >/dev/null ; then
                uname_a=`echo $1 | sed 's/^.*=//'`
            else
                uname_a="$2"
                shift
            fi
            shift
            ;;
    esac
done

# ==============================================================
# check if we are running as root with typical login shell paths

if [ $rootcheck -ne 0 -a `id -u` -ne 0 ]; then
  echo "You must be logged in as root to run this script."
  exit 1
fi

which depmod >/dev/null 2>&1

if [ $? -ne 0 ]; then
  PATH=/usr/local/sbin:/usr/sbin:/sbin:${PATH}
  which depmod >/dev/null 2>&1

  if [ $? -ne 0 ]; then
    echo "You arent running in a 'login shell'."
    echo "Please login directly from a console"
    echo "or use 'su -l' to get the same result."
    exit 1
  fi
fi

# ==============================================================
# assing default location of linux kernel headers

linuxbuild=/usr/src/linux
linuxsources=$linuxbuild

# in /lib/modules/<kernel-version> there is a symlink for latest kernel
# which calls "build" and points to the directory where modules were built.
# On some distros some configuration-independent kernel headers can't be
# found in "build" but in a different directory pointed to by a symlink
# called "source".
if [ -d /lib/modules/${uname_r}/build/include ]; then
    # just comment this line out if you already set an alternative location
    linuxbuild=/lib/modules/${uname_r}/build
    linuxsources=/lib/modules/${uname_r}/source
fi

linuxincludes=$linuxbuild/include

# ==============================================================
# print some statistics, helpful for analyzing any build failures

echo AMD kernel module generator version 2.1 | tee $logfile
echo . >> $logfile

echo Active kernel: >> $logfile
echo uname -a = `uname -a` >> $logfile
echo uname -s = `uname -s` >> $logfile
echo uname -m = `uname -m` >> $logfile
echo uname -r = `uname -r` >> $logfile
echo uname -v = `uname -v` >> $logfile
echo . >> $logfile

echo Target kernel: >> $logfile
echo uname -a = ${uname_a} >> $logfile
echo uname -s = ${uname_s} >> $logfile
echo uname -m = ${uname_m} >> $logfile
echo uname -r = ${uname_r} >> $logfile
echo uname -v = ${uname_v} >> $logfile
echo . >> $logfile

# ==============================================================
cd $current_wd

# ==============================================================
# locate and verify contents of kernel include file path

# verify match with respective line in linux/version.h
# sample: #define UTS_RELEASE "2.4.0-test7"

src_file=$linuxincludes/linux/version.h

if [ ! -e $src_file ]; then
  echo "kernel includes at $linuxincludes not found or incomplete" | tee -a $logfile
  echo "file: $src_file"                                           | tee -a $logfile
  exit 1
fi

OsRelease=${uname_r}

# Before 2.6.18 UTS-defines are in linux/version.h.
# For 2.6.18 to 2.6.32, UTS-defines are in linux/utsrelease.h.
# For 2.6.33 and later UTS-defines are in generated/utsrelease.h.
# Some old distributions used to define UTS-defines in external
# version-*.h files, e.g. linux-2.2.14-5.0-RedHat. Is this kludge still needed?
for src_file in \
    "$linuxincludes/linux/version.h" \
    "$linuxincludes/linux/utsrelease.h" \
    "$linuxincludes/generated/utsrelease.h" \
    "$linuxincludes/linux/version-*.h";
do
    UTS_REL_COUNT=`cat $src_file 2>/dev/null | grep UTS_RELEASE -c`
    if [ $UTS_REL_COUNT -gt 1 ]; then
        kernel_release=`cat $src_file | grep UTS_RELEASE | grep \"$OsRelease\" | cut -d'"' -f2`
        break
    elif [ $UTS_REL_COUNT -gt 0 ]; then
        kernel_release=`cat $src_file | grep UTS_RELEASE | cut -d'"' -f2` 
        break
    fi
done

# compare release string of running kernel with kernel name from headers

hit=0

if [ "$OsRelease" = "$kernel_release" ]; then
  hit=1
else
  # Red Hat 7.0 source and some newer 2.4.x might not have smp suffix in UTS_RELEASE text
  if [ `echo $OsRelease | grep smp -c` -ne 0 ]; then
    if [ "$OsRelease" = "${kernel_release}smp" ]; then
      hit=1
    fi
  fi
fi

if [ $hit -eq 0 ]; then
  echo "Error:"                                                         | tee -a $logfile
  echo "kernel includes at $linuxincludes do not match current kernel." | tee -a $logfile
  echo "they are versioned as \"$kernel_release\""                      | tee -a $logfile
  echo "instead of \"$OsRelease\"."                                     | tee -a $logfile
  echo "you might need to adjust your symlinks:"                        | tee -a $logfile
  echo "- /usr/include"                                                 | tee -a $logfile
  echo "- /usr/src/linux"                                               | tee -a $logfile
  exit 1
fi

kernel_release_major=${kernel_release%%.*}
kernel_release_rest=${kernel_release#*.}
kernel_release_minor=${kernel_release_rest%%.*}

if [ "$kernel_release_major" -lt 2 -o \
    \( "$kernel_release_major" -eq 2 -a "$kernel_release_minor" -lt 6 \) ]; then
    echo "Error:"
    echo "Your kernel version $kernel_release is not supported by this driver release."
    echo "Only 2.6.0 and newer kernels are supported."
    exit 1
fi

# ==============================================================
# resolve if we are running a SMP enabled kernel

SMP=0

# 1
# grep in OsVersion string for SMP specific keywords
OsVersion=${uname_v}

if [ `echo $OsVersion | grep [sS][mM][pP] -c` -ne 0 ]; then
  SMP=1
  echo "OsVersion says: SMP=$SMP"                                  >> $logfile
fi

# 2
# grep in /proc/ksyms for SMP specific kernel symbols
# use triggerlevel of 10 occurences 
# (UP kernels might have 0-1, SMP kernels might have 32-45 or much more)

src_file=/proc/ksyms

if [ -e $src_file ]; then
  if [ `fgrep smp $src_file -c` -gt 10 ]; then
    SMP=1
    echo "file $src_file says: SMP=$SMP"                             >> $logfile
  fi
fi

src_file=/proc/kallsyms

if [ -e $src_file ]; then
  if [ `fgrep smp $src_file -c` -gt 10 ]; then
    SMP=1
    echo "file $src_file says: SMP=$SMP"                             >> $logfile
  fi
fi

# 3
# linux/autoconf.h may contain this: #define CONFIG_SMP 1

# Before 2.6.33 autoconf.h is under linux/.
# For 2.6.33 and later autoconf.h is under generated/.
if [ -f $linuxincludes/generated/autoconf.h ]; then
    autoconf_h=$linuxincludes/generated/autoconf.h
else
    autoconf_h=$linuxincludes/linux/autoconf.h
fi
src_file=$autoconf_h

if [ ! -e $src_file ]; then
  echo "Warning:"                                                  >> $logfile
  echo "kernel includes at $linuxincludes not found or incomplete" >> $logfile
  echo "file: $src_file"                                           >> $logfile
  echo ""                                                          >> $logfile
else
  if [ `cat $src_file | grep "#undef" | grep "CONFIG_SMP" -c` = 0 ]; then
    SMP=`cat $src_file | grep CONFIG_SMP | cut -d' ' -f3`
    echo "file $src_file says: SMP=$SMP"                           >> $logfile
  fi
fi

if [ "$SMP" = 0 ]; then
  echo "assuming default: SMP=$SMP"                                >> $logfile
fi

# act on final result
if [ ! "$SMP" = 0 ]; then
  smp="-SMP"
  def_smp=-D__SMP__
fi

# ==============================================================
# resolve whether we need to set PAGE_ATTR_FIX 

PAGE_ATTR_FIX=0

src_file=/proc/ksyms

if [ -e $src_file ]; then
  if [ `fgrep " change_page_attr\$" $src_file -c` -gt 0 ]; then
    PAGE_ATTR_FIX=1
    echo "file $src_file says: PAGE_ATTR_FIX=$PAGE_ATTR_FIX"         >> $logfile
  fi
fi

src_file=/proc/kallsyms

if [ -e $src_file ]; then
  if [ `fgrep " change_page_attr\$" $src_file -c` -gt 0 ]; then
    PAGE_ATTR_FIX=1
    echo "file $src_file says: PAGE_ATTR_FIX=$PAGE_ATTR_FIX"         >> $logfile
  fi
fi

# ==============================================================
# resolve if we are running a MODVERSIONS enabled kernel

MODVERSIONS=0

# autoconf.h may contain this: #define CONFIG_MODVERSIONS 1
src_file=$autoconf_h
if [ ! -e $src_file ];
then
  echo "Warning:"                                                  >> $logfile
  echo "kernel includes at $linuxincludes not found or incomplete" >> $logfile
  echo "file: $src_file"                                           >> $logfile
  echo ""                                                          >> $logfile
else
  if [ `cat $src_file | grep "#undef" | grep "CONFIG_MODVERSIONS" -c` = 0 ]
  then
    MODVERSIONS=`cat $src_file | grep CONFIG_MODVERSIONS | cut -d' ' -f3`
    echo "file $src_file says: MODVERSIONS=$MODVERSIONS"           >> $logfile
  fi
fi

if [ $MODVERSIONS = 0 ]
then
  echo "assuming default: MODVERSIONS=$MODVERSIONS"                >> $logfile
fi

# act on final result
if [ ! $MODVERSIONS = 0 ]
then
  def_modversions="-DMODVERSIONS"
fi

# ==============================================================
# resolve if we are building for a kernel with a fix for CVE-2010-3081
# On kernels with the fix, use arch_compat_alloc_user_space instead
# of compat_alloc_user_space since the latter is GPL-only

COMPAT_ALLOC_USER_SPACE=compat_alloc_user_space

for src_file in \
    $linuxbuild/arch/x86/include/asm/compat.h \
    $linuxsources/arch/x86/include/asm/compat.h \
    $linuxbuild/include/asm-x86_64/compat.h \
    $linuxsources/include/asm-x86_64/compat.h;
do
  if [ -e $src_file ];
  then
    break
  fi
done
if [ ! -e $src_file ];
then
  echo "Warning: x86 compat.h not found in kernel headers"         >> $logfile
  echo "neither arch/x86/include/asm/compat.h nor include/asm-x86_64/compat.h" >> $logfile
  echo "could be found in $linuxbuild or $linuxsources"            >> $logfile
  echo ""                                                          >> $logfile
else
  if [ `cat $src_file | grep -c arch_compat_alloc_user_space` -gt 0 ]
  then
    COMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space
  fi
  echo "file $src_file says: COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE" >> $logfile
fi


# ==============================================================
# break down OsRelease string into its components

major=`echo $OsRelease | sed -n -e s/"^\([[:digit:]]*\)\.\([[:digit:]]*\)\.\([[:digit:]]*\)\(.*\)"/"\\1"/p`
minor=`echo $OsRelease | sed -n -e s/"^\([[:digit:]]*\)\.\([[:digit:]]*\)\.\([[:digit:]]*\)\(.*\)"/"\\2"/p`
patch=`echo $OsRelease | sed -n -e s/"^\([[:digit:]]*\)\.\([[:digit:]]*\)\.\([[:digit:]]*\)\(.*\)"/"\\3"/p`
extra=`echo $OsRelease | sed -n -e s/"^\([[:digit:]]*\)\.\([[:digit:]]*\)\.\([[:digit:]]*\)\(.*\)"/"\\4"/p`

if [ "$1" = "verbose" ]
then
  echo OsRelease=$OsRelease  | tee -a $logfile
  echo major=$major          | tee -a $logfile
  echo minor=$minor          | tee -a $logfile
  echo patch=$patch          | tee -a $logfile
  echo extra=$extra          | tee -a $logfile
  echo SMP=$SMP              | tee -a $logfile
  echo smp=$smp              | tee -a $logfile
fi

echo . >>$logfile

# ==============================================================
# make kernel module and check results

kmod_extension=.ko

echo "doing Makefile based build for kernel 2.6.x and higher" | tee -a $logfile

cd 2.6.x

make clean

echo 'This is a dummy file created to suppress this warning: could not find /lib/modules/fglrx/build_mod/2.6.x/.libfglrx_ip.a.cmd for /lib/modules/fglrx/build_mod/2.6.x/libfglrx_ip.a' > .lib${MODULE}_ip.a.cmd

CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions"
make CC=${CC} \
    LIBIP_PREFIX=$(echo "$LIBIP_PREFIX" | sed -e 's|^\([^/]\)|../\1|') \
    MODFLAGS="$CFLAGS_MODULE" \
    CFLAGS_MODULE="$CFLAGS_MODULE" \
    KVER=${uname_r} \
    PAGE_ATTR_FIX=$PAGE_ATTR_FIX \
    > tlog 2>&1 

res=$?

tee -a $logfile < tlog
rm -f tlog

cd ..

if [ $res -eq 0 ]; then
    echo "build succeeded with return value $res" | tee -a $logfile
else
    echo "build failed with return value $res" | tee -a $logfile
    exit 1
fi

if [ -e ${MODULE}${kmod_extension} ]; then
    rm -f ${MODULE}${kmod_extension}
fi

ln -s 2.6.x/${MODULE}${kmod_extension}

echo .  >> $logfile

# ==============================================================
# install generated file at required location

TERMINAL_HINT=0

if [ `pwd | grep "/lib/modules/${MODULE}/build_mod\$" -c` -gt 0 ]; then 
  echo duplicating results into driver repository...   | tee -a $logfile
  
  target_dir=`pwd`/..
  target_dir=`cd $target_dir;pwd`
  
  echo "target location: $target_dir" >> $logfile 
  
  which strip > /dev/null 2>&1
  
  if test $? = 0; then
     if [ ! -z "${FGLRX_DEBUG}" ]; then
        cp -f ${MODULE}${kmod_extension} ${MODULE}_dbg${kmod_extension}
     fi

     strip -g ${MODULE}${kmod_extension} > /dev/null 2>&1

     if test $? = 0; then	
        echo "the debug info stripped from the kernel module" >> $logfile
     else
        echo "could not strip the debug info of kernel module" >> $logfile
     fi 
  else
     echo "could not find the strip utility on your system" >> $logfile
  fi

  echo "copying ${MODULE}${kmod_extension}" >> $logfile
  
  cp -f ${MODULE}${kmod_extension} $target_dir/${MODULE}.$OsRelease${kmod_extension} | tee -a $logfile
  
  echo "copying logfile of build" >> $logfile
  echo "*** end of build log ***" >> $logfile
  
  cp -f $logfile $target_dir/make.$OsRelease.log

  # terminal hint message
  TERMINAL_HINT=1
else
  # the build was done from an external location - installation not intended
  echo "duplication skipped - generator was not called from regular lib tree" | tee -a $logfile 
fi

# ==============================================================
# finale

echo done.

if [ $TERMINAL_HINT -eq 1 ]; then
  echo "You must change your working directory to $target_dir"
  echo "and then call ./make_install.sh in order to install the built module."
fi

#EOF
