# Maintainer: Dieghen89 <dieghen89@gmail.com>
# Thanks to graysky for a lot of features in this PKGBUILD

TUX_ON_ICE="y"
BROADCOM_WL="n"
LOCALMODCONFIG="n"
USE_CURRENT="n"
UKSM="y"

### HOW-TO:
#
## >> Details for: TUX_ON_ICE
#		Set it to "n" you you don't want the Tux On Ice support
#
## >> Details for: BROADCOM_WL
#		Set is to "y" if you need the iw module for your wireless card
#
## >> Details for: LOCALMODCONFIG
#		Set it to "y" if you want to modify my config file and include only
#		the modules that you are using in this moment.
#		Be sure that are all probed!
#
#		P.S. this pkgbuild supports the graysky's modprobe_db package
#
## >> Details for: USE_CURRENT
#		Use your current config file istead the one shipped by kernel-netbook
#
## >> Details for: UKSM
#		Set it to "y" to enable the testing uKSM patch, more info here:
#		http://kerneldedup.org
#
## >> The previous BFQ_IO_SCHEDULER is useless, read the wiki page in google code
#
##########
 
pkgname=kernel-netbook
true && pkgname=('kernel-netbook' 'kernel-netbook-headers')
makedepends=('dmidecode' 'xmlto' 'docbook-xsl' 'linux-firmware')
optdepends=('hibernate-script: tux on ice default script' 'tuxonice-userui: graphical interface for toi [AUR]')
_basekernel=3.6
pkgver=${_basekernel}.2
pkgrel=1
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) and patchset (BFS + TOI + BFQ optional) - Only Intel GPU - Give more power to your netbook!"
options=('!strip')
arch=('i686')
license=('GPL2')
url=('http://code.google.com/p/kernel-netbook')

####################################
md5sums=('575c735175532201f1bbd6ec99712b55'
         '2de141f7a016e842b57725c5090135bd'
         '62d04d148b99f993ef575a71332593a9'
         'ac4c4ff4ea110336b2879fef58dd8751'
         'f8d5472706d94a2707dd53bad5ccd00e'
         'b5df48a60787f0abe275fe9df1bbef35'
         '4f8b8f819cbea3447df9416708229402'
         '396e269281a5d78d721a317796cfb5a6'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'a6f0377c814da594cffcacbc0785ec1a'
         'e037f08b0ddc52a0b6f9b7fec7da367a'
         '160a6054ceca92db60898852983a42d4'
         '1e06c9b7d92d61eab05e970116837144'
         '9d3c56a4b999c8bfbd4018089a62f662'
         'a9c018cb0b9caa90f03ee90b71a2c457'
         '7bf5d4701d0d27313623a6ebc63f2bcb')
#############################################
#  external drivers, firmware and variables #
#############################################

#Broadcom-wl:
broadcom_ver=5.100.82.112
broadcom="hybrid-portsrc_x86_32-v${broadcom_ver//./_}"
#BFS: - http://users.on.net/~ckolivas/kernel/ -
_ckpatchversion=1
#_ckpatchname="patch-${_basekernel}-ck${_ckpatchversion}"
_ckpatchname="patch-3.6-ck${_ckpatchversion}"
#BFQ: - http://algo.ing.unimo.it/people/paolo/disk_sched/ -
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.6.0-v5"
#TuxOnIce:
#_toipatch="tuxonice-3.3-for-Linux-3.4.patch"
_toipatch="toi-3.6.patch"
#uKSM:
_uksm="http://kerneldedup.org/download/uksm/0.1.2.1"
_uksm_name="uksm-0.1.2.1-for-v3.6.ge.2"
##### Sources #####
source=( #kernel sources and arch patchset
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2"
	"http://ftp.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.bz2"
	##external drivers:
	"http://www.broadcom.com/docs/linux_sta/${broadcom}.tar.gz"
	#BFS patch:
	#"http://ck.kolivas.org/patches/3.0/3.5/${_basekernel}-ck${_ckpatchversion}/${_ckpatchname}.bz2"
	http://repo-ck.com/PKG_source/testing/unofficial_patchset_from_martin/patch-3.6-ck1.bz2
	#BFQ patch:
	"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v5-3.6.patch"
	"${_bfqpath}/0002-block-introduce-the-BFQ-v5-I-O-sched-for-3.6.patch"
	#TuxOnIce:
	"${_toipatch}"
	#uKSM
	"${_uksm}/${_uksm_name}.patch"
	"logo_linux_mono.pbm"
	"logo_linux_clut224.ppm"
	"logo_linux_vga16.ppm"
	#Others:
	"linux-recent.patch"
	"license.patch"
	"user-ioctl.patch"
	"change-default-console-loglevel.patch"
	"kernel-netbook.preset"
	"config")
	
build() {

  cd ${srcdir}/linux-$_basekernel

  # Patching Time:

  # minorversion patch:
  msg "Minorversion patch"
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

  # replace tux logo with arch one
  install -m644 ${srcdir}/logo_linux_clut224.ppm drivers/video/logo/
  install -m644 ${srcdir}/logo_linux_mono.pbm drivers/video/logo/
  install -m644 ${srcdir}/logo_linux_vga16.ppm drivers/video/logo/

  # --> BFS
  msg "Patching source with BFS patch:"
  #Adjust localversion
  sed -i -e "s/-ck${_ckpatchversion}//g" ${srcdir}/${_ckpatchname}
  #patching time
  patch -Np1 -i ${srcdir}/${_ckpatchname}
  
  # --> TOI
  if [ $TUX_ON_ICE = "y" ] ; then
    msg "Patching source with TuxOnIce patch"
    patch -Np1 -i ${srcdir}/${_toipatch}
  fi

  # --> BFQ
  msg "Patching source with BFQ patches"
  for patch in $(ls ${srcdir}/000*BFQ*.patch) ; do
    patch -Np1 -i $patch
  done

  # --> uKSM
  if [ $UKSM = "y" ] ; then
    msg "Patching source with uKSM patch"
    patch -Np1 -i ${srcdir}/${_uksm_name}.patch
  fi

  ### Clean tree and copy config file over
  msg "Running make mrproper to clean source tree"
  make mrproper

  # copy config
  cp ../config ./.config
  
  if [ $USE_CURRENT = "y" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "You kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

  make prepare
  
  	if [ $LOCALMODCONFIG = "y" ] ; then
		msg "If you have modprobe_db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed_db ] ; then
			[[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
			sudo /usr/bin/modprobed_db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # make defconfig
  # configure kernel    
  # use menuconfig, if you want to change the configuration
  make menuconfig
  # make gconfig
  # make nconfig
  yes "" | make config
  # build kernel
  msg "Now starts something magic:"
  make ${MAKEFLAGS} bzImage modules
}

package_kernel-netbook() {
  pkgdesc='Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) - Only Intel GPU - Give more power to your netbook!'
  depends=('coreutils' 'kmod')
  install=kernel-netbook.install
  optdepends=('crda: for wireless regulatory domain support' 
	      'linux-firmware: firmware for rt2860, tigon3, brcmsmac'
	      'hibernate-script: tux on ice default script'
	      'tuxonice-userui: graphical interface for toi [AUR]')
  groups=(eee)
  provides=('linux')

  cd ${srcdir}/linux-$_basekernel
  # install our modules
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install

  # Get kernel version
  _kernver="$(make kernelrelease)"

  # remove build and source links
  rm -r $pkgdir/lib/modules/$_kernver/{source,build}
  
  # remove the firmware directory
  rm -rf ${pkgdir}/lib/firmware

  # install the kernel
  install -D -m644 ${srcdir}/linux-$_basekernel/System.map $pkgdir/boot/System.map-netbook
  install -D -m644 ${srcdir}/linux-$_basekernel/arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz-netbook
  install -D -m644 ${srcdir}/linux-$_basekernel/.config $pkgdir/boot/kconfig-netbook

  # install preset file for mkinitcpio
  #sed -i -e "s/ALL_kver=.*/ALL_kver=\'${_kernver}\'/g" ${srcdir}/${pkgname}.preset
  install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

  # set correct depmod command for install
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/$pkgname.install

##Extramodules dir support
  _extramodules="extramodules-${_basekernel}${_kernelname:--netbook}"  

##Section: Broadcom-wl
  if [ "${BROADCOM_WL}" == "y" ] ; then
    msg "Compiling broadcom-wl module:"
    cd ${srcdir}/
    cp -ar src/wl src/wl_orig
    patch -p1 -i linux-recent.patch
    patch -p1 -i license.patch
    patch -p1 -i user-ioctl.patch
    make -C ${srcdir}/linux-$_basekernel M=`pwd`
    install -D -m 755 wl.ko ${pkgdir}/lib/modules/${_extramodules}/wl.ko
    rm src/wl/* && rmdir src/wl
    mv src/wl_orig src/wl
  fi

  # gzip -9 all modules to safe a lot of MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

  # make room for external modules
  ln -s "../${_extramodules}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/${_extramodules}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/${_extramodules}/version"

  cd ${srcdir}/linux-${_basekernel}
  # move module tree /lib -> /usr/lib
  mkdir $pkgdir/usr
  mv "$pkgdir/lib" "$pkgdir/usr/"

  # Now we call depmod...
  depmod -b "$pkgdir/usr" -F System.map "$_kernver"
}

package_kernel-netbook-headers() {
  KARCH=x86
  pkgdesc='Header files and scripts for building modules for kernel-netbook'
  provides=('linux-headers')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${pkgdir}/usr/lib/modules/${_kernver}"
  ln -sf ../../../src/linux-${_kernver} build

  cd "${srcdir}/linux-${_basekernel}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/src/linux-${_kernver}/.config"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

  for i in acpi asm-generic config crypto drm generated linux math-emu \
    media net pcmcia scsi sound trace video xen; do
    cp -a include/${i} "${pkgdir}/usr/src/linux-${_kernver}/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/src/linux-${_kernver}/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/src/linux-${_kernver}"
  cp -a scripts "${pkgdir}/usr/src/linux-${_kernver}"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/src/linux-${_kernver}/scripts"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel/"

  # add headers for lirc package
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video"

  cp drivers/media/video/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/"

  for i in bt8xx cpia2 cx25840 cx88 em28xx pwc saa7134 sn9c102; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
    cp -a drivers/media/video/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
  done

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/src/linux-${_kernver}/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core"
  cp drivers/media/dvb/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  cp drivers/media/dvb/frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  cp drivers/media/video/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb"
  cp drivers/media/dvb/dvb-usb/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends"
  cp drivers/media/dvb/frontends/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners"
  cp drivers/media/common/tuners/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/mm"
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do
    mkdir -p "${pkgdir}"/usr/src/linux-${_kernver}/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/src/linux-${_kernver}/${i}"
  done

  chown -R root.root "${pkgdir}/usr/src/linux-${_kernver}"
  find "${pkgdir}/usr/src/linux-${_kernver}" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/src/linux-${_kernver}/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}

##
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) - Only Intel GPU - Give more power to your netbook!"
