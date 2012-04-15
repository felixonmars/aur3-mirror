# Maintainer: Dieghen89 <dieghen89@gmail.com>
# Thanks to graysky for a lot of features in this PKGBUILD

BFQ_IO_SCHEDULER="y"
TUX_ON_ICE="n" #Use the HEAD patch by git tree
BROADCOM_WL="n"
LOCALMODCONFIG="n"
USE_CURRENT="n"

### HOW-TO:
#
## >> Details for: BFQ_IO_SCHEDULER
#		Set it to "n" if you don't want the module compiled.
#		In any case, it isn't the default io-scheduler
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

pkgname=kernel-netbook
true && pkgname=('kernel-netbook' 'kernel-netbook-headers')
makedepends=('dmidecode' 'xmlto' 'docbook-xsl' 'linux-firmware')
optdepends=('hibernate-script: tux on ice default script' 'tuxonice-userui: graphical interface for toi [AUR]')
_basekernel=3.3
pkgver=${_basekernel}.2
pkgrel=3
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) and patchset (BFS + TOI + BFQ optional) - Only Intel GPU - Give more power to your netbook!"
options=('!strip')
arch=('i686')
license=('GPL2')
url=('http://code.google.com/p/kernel-netbook')

####################################
md5sums=('98a6cdd7d082b7ea72df9c89842bac74'
         '6c06d29ee2bd60d4482ebeedd9f3a8da'
         '62d04d148b99f993ef575a71332593a9'
         '15a65cc8e4a9720a044fcdaac8bb2522'
         '6b2425e00827d1b795001d09c8135a30'
         '83577ddfbcd2bdc079bff04c5848b8e1'
         '3c7bba84075454322a05f105029b10a7'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'a6f0377c814da594cffcacbc0785ec1a'
         '3f79843b6b1a3f7e8041eb8ed86e4ff5'
         '2bb172117ede96c14289f9f9bc34f58f'
         'aee89fe7f034aea2f2ca95322774c1b5'
         '1f0ab857c69754c992b0d1d871b8cc66'
         '9d3c56a4b999c8bfbd4018089a62f662'
         '263725f20c0b9eb9c353040792d644e5'
         'c8299cf750a84e12d60b372c8ca7e1e8'
         'a9c018cb0b9caa90f03ee90b71a2c457'
         'e4ffc5d40fdfe3faeb88c08bbe514afb')
###################################
#  external drivers  and firmware #
###################################

#Broadcom-wl:
broadcom_ver=5.100.82.112
broadcom="hybrid-portsrc_x86_32-v${broadcom_ver//./_}"
#BFS: - http://users.on.net/~ckolivas/kernel/ -
_ckpatchversion=1
_ckpatchname="patch-${_basekernel}-ck${_ckpatchversion}"
#BFQ: - http://algo.ing.unimo.it/people/paolo/disk_sched/ -
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.3.0-v3r3"
#TuxOnIce:
#_toipatch="current-tuxonice-for-3.0.patch.bz2"
#_toipatch="tuxonice-3.2-for-3.2-rc5.patch.bz2"
_toipatch="tuxonice-2012Feb05-for_Linux_3_2_5.patch"
##### Sources #####
source=( #kernel sources and arch patchset
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2"
	"http://ftp.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.bz2"
	#"ftp://ftp.archlinux.org/other/linux/patch-${pkgver}.gz"
	##external drivers:
	"http://www.broadcom.com/docs/linux_sta/${broadcom}.tar.gz"
	#BFS patch:
	"http://ck.kolivas.org/patches/3.0/3.3/${_basekernel}-ck${_ckpatchversion}/${_ckpatchname}.bz2"
	#BFQ patch:
	"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v3r3-3.3.patch"
	"${_bfqpath}/0002-block-introduce-the-BFQ-v3r3-I-O-sched-for-3.3.patch"
	#TuxOnIce:
	#"http://tuxonice.net/files/${_toipatch}"
	#"http://user.it.uu.se/~mikpe/linux/patches/tuxonice/${_toipatch}"
	"http://chakra-linux.org/sources/linux/patches/3.2/features/tuxonice/${_toipatch}.xz"
	#Arch Logo
	"logo_linux_mono.pbm"
	"logo_linux_clut224.ppm"
	"logo_linux_vga16.ppm"
	#Others:
	"linux3.patch"
	"license.patch"
	"semaphore.patch"
	"multicast.patch"
	"change-default-console-loglevel.patch"
	"i915-fix-ghost-tv-output.patch"
	"ext4-options.patch"
	"kernel-netbook.preset"
	"config")
	
build() {

  cd ${srcdir}/linux-$_basekernel

  # Patching Time:

  # minorversion patch:
  msg "Minorversion patch"
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # Some chips detect a ghost TV output
  # mailing list discussion: http://lists.freedesktop.org/archives/intel-gfx/2011-April/010371.html
  # Arch Linux bug report: FS#19234
  #
  # It is unclear why this patch wasn't merged upstream, it was accepted,
  # then dropped because the reasoning was unclear. However, it is clearly
  # needed.
  patch -Np1 -i "${srcdir}/i915-fix-ghost-tv-output.patch"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  
  # fix ext4 module to mount ext3/2 correct
  # https://bugs.archlinux.org/task/28653
  patch -Np1 -i "${srcdir}/ext4-options.patch"

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
    #bzip2 -d ${srcdir}/${_toipatch} \
    #    | sed 's/printk(KERN_INFO "PM: Creating hibernation image:\\n/printk(KERN_INFO "PM: Creating hibernation image: \\n/' \
    #    | patch -Np1 -F4 || { echo "Failed TOI"; return 1 ; }
    patch -Np1 -F4 -i ${srcdir}/${_toipatch}
  fi

  # --> BFQ
  if [ $BFQ_IO_SCHEDULER = "y" ] ; then
    msg "Patching source with BFQ patches"
    for i in $(ls ${srcdir}/000*.patch); do
      patch -Np1 -i $i
    done
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
  depends=('coreutils' 'module-init-tools')
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
    #patching broadcom as broadcom-wl package on AUR
    patch -p1 -i linux3.patch
    patch -p1 -i license.patch
    patch -p1 -i multicast.patch
    patch -p1 -i semaphore.patch
    make -C ${srcdir}/linux-$_basekernel M=`pwd`
    install -D -m 755 wl.ko ${pkgdir}/lib/modules/${_extramodules}/wl.ko
  fi

  # gzip -9 all modules to safe a lot of MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

  # make room for external modules
  ln -s "../${_extramodules}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/${_extramodules}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/${_extramodules}/version"
}

package_kernel-netbook-headers() {
  KARCH=x86
  pkgdesc='Header files and scripts for building modules for kernel-netbook'
  provides=('linux-headers')

  mkdir -p "${pkgdir}/lib/modules/${_kernver}"

  cd "${pkgdir}/lib/modules/${_kernver}"
  ln -sf ../../../usr/src/linux-${_kernver} build

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

  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102; do
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
