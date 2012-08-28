#!/bin/bash

kernver=${KERNVER:-$(uname -r)}
arch=${ARCH:-$(uname -m)}
arch=${arch/i686/i386}
LOG="/var/log/catalyst-install.log"

#patch_files(){
#    file_patch="${kernver:0:6}.patch"
#    if [[ -f "${file_patch}" ]]; then
#        patch -Np6 -i ${file_patch} || return 1
#    fi
#}


install_module(){
    echo ""
    echo "--------"
    date '+%Y-%m-%d %H:%M:%S'
    echo "Building fglrx module for ${kernver} kernel ..."
    echo "--------"

    if [ -d "/usr/lib/modules/${kernver}" ]; then
	    where_modules="/usr/lib/modules"
	    elif [ -d "/lib/modules/${kernver}" ]; then
		    where_modules="/lib/modules"
    fi

    if [ ! -d "${where_modules}/${kernver}/build" ]; then
      echo "Kernel header files are absent: directory ${where_modules}/${kernver}/build doesn't exist! Game over"
      return 1
    fi
    workdir=$(mktemp -du /tmp/catalyst.XXXXXX)
#    set -x
    cp "/usr/share/ati/build_mod" "${workdir}" -R
    cd "$workdir"

    patch -Np7 -i makefile_compat.patch || return 1
    patch -Np6 -i 3.5-do_mmap.patch || return 1

#    if [[ ${kernver:0:6} < "2.6.39" ]] && [[ `cat ${where_modules}/${kernver}/build/.config | grep -c CONFIG_BKL=y` = 0 ]]; then
#	patch -Np6 -i no_bkl.patch || return 1
#    fi

#    if [[ ${kernver:0:6} == "2.6.39" ]] || [[ ${kernver:0:6} > "2.6.39" ]]; then
#	patch -Np6 -i no_bkl.patch || return 1
#        patch -Np6 -i 2.6.39_bkl.patch || return 1
#    fi

#    patch_files

  ## include ati_make.sh and use _ati_check function from it
    . ati_make.sh
    _ati_check

  ## Compile module using _ati_check variables
    make -C ${where_modules}/${kernver}/build SUBDIRS="`pwd`" ARCH=${arch} \
      MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions" \
      PAGE_ATTR_FIX=$PAGE_ATTR_FIX COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE modules || return 1

    gzip -9 fglrx.ko

  ## here we are checking kernel's extramodules dir
    for r in ${where_modules}/*; do
      if [ $where_modules = "/usr/lib/modules" ]; then
	s=${r:17}
      elif [ $where_modules = "/lib/modules" ]; then
	s=${r:13}
      fi
      if [[ ${s:0:3} = "ext" ]]; then
	if [[ `cat ${r}/version | grep -c ${kernver}` != 0 ]]; then
	  destidir=${s}
	fi
	elif [[ ${s} = ${kernver} ]] && [[ ! -e ${r}/extramodules ]]; then
	  destidir=${kernver}/video
      fi
    done

    install -m755 -d "${where_modules}/${destidir}/" || return 1
    install -m644 fglrx.ko.gz "${where_modules}/${destidir}/" || return 1

    depmod ${kernver}
    rm -rf "${workdir}"
#    set +x
    echo "Ok."
}

build_all_modules(){
if [ -d "/usr/lib/modules" ]; then
        for p in /usr/lib/modules/*; do
        if [ ${p:17:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
          /usr/bin/catalyst_build_module ${p##*/usr/lib/modules/}
        fi
        done
fi
if [ -d "/lib/modules" ] && [ -d "/usr/lib/modules" ]; then
        for ls_lib in /lib/modules/*; do
                repeat=0
                for ls_usr in /usr/lib/modules/*; do
                        if [ ${ls_lib##*/lib/modules/} = ${ls_usr##*/usr/lib/modules/} ];then
                                repeat=1
                                break
                        fi
                done
                if [[ $repeat == "0" ]] && [ ${p:13:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
                        /usr/bin/catalyst_build_module ${p##*/lib/modules/}
                fi
        done
elif [[ -d "/lib/modules" ]] && [[ ! -d "/usr/lib/modules" ]]; then
        for p in /lib/modules/*; do
                if [ ${p:13:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
                        /usr/bin/catalyst_build_module ${p##*/lib/modules/}
                fi
        done
fi
}

remove_module(){
if [ -d "/usr/lib/modules" ]; then
    for p in /usr/lib/modules/*; do
      if [[ ${p:17:3} != "ext" ]]; then
	if [ ! -d $p/kernel ]; then  #check if /usr/lib/modules/p/kernel directory does NOT exist
	  if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]] || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/video/fglrx.ko.gz" &>/dev/null
	    rm "$p/video/fglrx.ko" &>/dev/null
	    rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	    rm "$p/extramodules/fglrx.ko" &>/dev/null
	    rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	  fi
	  if [ -d $p ]; then   #check if ${where_modules}/p exist
	    if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	      echo "+ removing empty directory: $p"
	      rm -rf $p
		else echo "- $p looks like unused, maybe remove it manualy?"
	    fi
	  fi
	fi
      fi
    done
fi

if [ -d "/lib/modules" ]; then
    for p in /lib/modules/*; do
      if [[ ${p:13:3} != "ext" ]]; then
	if [ ! -d $p/kernel ]; then  #check if /lib/modules/p/kernel directory does NOT exist
	  if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]] || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/video/fglrx.ko.gz" &>/dev/null
	    rm "$p/video/fglrx.ko" &>/dev/null
	    rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	    rm "$p/extramodules/fglrx.ko" &>/dev/null
	    rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	  fi
	  if [ -d $p ]; then   #check if ${where_modules}/p exist
	    if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	      echo "+ removing empty directory: $p"
	      rm -rf $p
		else echo "- $p looks like unused, maybe remove it manualy?"
	    fi
	  fi
	fi
      fi
    done
fi
}

remove_all_modules(){
if [ -d "/usr/lib/modules" ]; then
   for p in /usr/lib/modules/*; do
    if [[ ${p:17:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]]  || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
      echo "+ removing fglrx module from $p"
      rm "$p/video/fglrx.ko.gz" &>/dev/null
      rm "$p/video/fglrx.ko" &>/dev/null
      rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
      rm "$p/extramodules/fglrx.ko" &>/dev/null
      rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
      depmod $(basename $p)
     fi
     if [ -d $p ]; then   #check if /usr/lib/modules/p exist
      if [ -z "$(ls $p)" ]; then   #check if /usr/lib/modules/p is empty
	echo "+ removing empty directory: $p"
	rm -rf $p
	elif [ ! -d $p/kernel ]; then
	  echo "- $p looks like unused, maybe remove it manualy?"
      fi
     fi
    fi
   done
fi

if [ -d "/lib/modules" ]; then
   for p in /lib/modules/*; do
    if [[ ${p:13:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]]  || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
      echo "+ removing fglrx module from $p"
      rm "$p/video/fglrx.ko.gz" &>/dev/null
      rm "$p/video/fglrx.ko" &>/dev/null
      rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
      rm "$p/extramodules/fglrx.ko" &>/dev/null
      rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
      depmod $(basename $p)
     fi
     if [ -d $p ]; then   #check if ${where_modules}/p exist
      if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	echo "+ removing empty directory: $p"
	rm -rf $p
	elif [ ! -d $p/kernel ]; then
	  echo "- $p looks like unused, maybe remove it manualy?"
      fi
     fi
    fi
   done
fi
}

remove_old_modules(){
   for p in /lib/modules/*; do
    if [[ ${p:13:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
      echo "+ removing old fglrx module from $p"
      rm "$p/video/fglrx.ko" &>/dev/null
      rm "$p/extramodules/fglrx.ko" &>/dev/null
      rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
      depmod $(basename $p)
     fi
    fi
   done
}

auto_recompile(){
    # add hook fglrx to mkiniticpio
    hooks=$(grep ^HOOKS /etc/mkinitcpio.conf | grep fglrx)
    if [ "$hooks" = "" ]; then
        # add hook fglrx
        sed 's/^HOOKS="\([^"]*\)"/HOOKS="\1 fglrx"/' -i /etc/mkinitcpio.conf
    fi
    #add kernel26-headers to SyncFirst array of pacman.conf
    heads=$(grep ^SyncFirst /etc/pacman.conf | grep kernel26-headers)
    if [ "$heads" = "" ]; then
        # add heads
	sed '/^SyncFirst/s|$| kernel26-headers|' -i /etc/pacman.conf
    fi
    echo "----------------------------------------------------------------"
    echo "Answer 'Yes' whenever pacman ask you about updating"
    echo "'kernel26-headers' in first place"
    echo "----------------------------------------------------------------"
}

auto_recompile_off(){
    # remove hook fglrx
    sed '/^HOOKS/s/ *fglrx//' -i /etc/mkinitcpio.conf
    # remove heads
    sed '/^SyncFirst/s/ *kernel26-headers//' -i /etc/pacman.conf
    echo "Auto re-compilation is Disabled."
}

case "$1" in
    help|--help)
        echo "usage: $0 {version|all|remove|remove_all|auto|autooff}"
        echo "- with no specified kernel version it will use the current kernel version to build module"
	echo "- all will try to build fglrx modules for all working system's kernels"
        echo "- remove is removing unused fglrx modules and all empty ${where_modules}/* directories"
        echo "- remove_all is removing all fglrx modules and all empty ${where_modules}/* directories"
        echo "- auto will turn ON 'auto re-compilation of fglrx module with every kernel update'"
        echo "- autooff will turn off auto re-compilation of fglrx module"
        ;;
    remove)
        remove_module
        ;;
    remove_all)
        remove_all_modules
        ;;
    remove_old)
        remove_old_modules
        ;;
    auto)
	auto_recompile
	;;
    autooff)
	auto_recompile_off
	;;
    all)
	build_all_modules
	;;
    *)
        test "$1" != "" && kernver="$1"
	echo "Building fglrx module for ${kernver} kernel ..."
        install_module >> $LOG 2>&1 && echo "Ok." || echo "Failed!!! Check out log: $LOG"
        ;;
esac

