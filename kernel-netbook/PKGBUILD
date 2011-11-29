# Maintainer: Dieghen89 <dieghen89@gmail.com>

BFQ_IO_SCHEDULER="y"
TUX_ON_ICE="n"

pkgname=kernel-netbook
true && pkgname=('kernel-netbook' 'kernel-netbook-headers')
makedepends=('dmidecode' 'xmlto' 'docbook-xsl' 'linux-firmware')
optdepends=('hibernate-script: tux on ice default script' 'tuxonice-userui: graphical interface for toi [AUR]')
_basekernel=3.1
pkgver=${_basekernel}.4
pkgrel=1
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) and patchset (BFS + TOI + BFQ optional) - Only Intel GPU - Give more power to your netbook!"
options=('!strip')
arch=('i686')
license=('GPL2')
url=('http://code.google.com/p/kernel-netbook')

####################################
md5sums=('8d43453f8159b2332ad410b19d86a931'
	 'b8b14bdfbf76cfef8e042e7d1a385fca'
         '62d04d148b99f993ef575a71332593a9'
         'a4c69095403ff44d5dfd8a935c3aca5a'
         'e470805b4ef9d469a85b6e2f811ac337'
         '61ca56c06bf197c0548ecd9fe01b2515'
         '93e1b461374ae8b5147bba9887964cbe'
         'afbd01926c57fc5b82ee6034dc9311e5'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'a6f0377c814da594cffcacbc0785ec1a'
         '2bb172117ede96c14289f9f9bc34f58f'
         'aee89fe7f034aea2f2ca95322774c1b5'
         '9d3c56a4b999c8bfbd4018089a62f662'
         '263725f20c0b9eb9c353040792d644e5'
         'a50c9076012cb2dda49952dc6ec3e9c1'
         '61a6be40e8e1e9eae5f23f241e7a0779'
         '442334d777475e2a37db92d199672a28'
         '52d41fa61e80277ace2b994412a0c856'
         'de12ec5c342f945a95b2f12c2b85e6bf'
         'a9c018cb0b9caa90f03ee90b71a2c457'
         '9f9a1ba7ddb030d78aa1606229b18532')
###################################
#  external drivers  and firmware #
###################################

#Broadcom-wl:
broadcom_ver=5.100.82.112
broadcom="hybrid-portsrc_x86_32-v${broadcom_ver//./_}"
#BFS: - http://users.on.net/~ckolivas/kernel/ -
_ckpatchversion=2
_ckpatchname="patch-${_basekernel}.0-ck${_ckpatchversion}"
#BFQ: - http://algo.ing.unimo.it/people/paolo/disk_sched/ -
_bfqpatchversion="1"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.1.0-v3r1"
#TuxOnIce:
_toipatch="current-tuxonice-for-3.0.patch.bz2"

##### Sources #####
source=( #kernel sources and arch patchset
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2"
	"http://ftp.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.bz2"
	#"ftp://ftp.archlinux.org/other/linux/patch-${pkgver}.gz"
	##external drivers:
	"http://www.broadcom.com/docs/linux_sta/${broadcom}.tar.gz"
	#"http://switch.dl.sourceforge.net/sourceforge/syntekdriver/stk11xx-$stk11xx_ver.tar.gz"
	#BFS patch:
	"http://ck.kolivas.org/patches/3.0/3.1/${_basekernel}.0-ck${_ckpatchversion}/${_ckpatchname}.bz2"
	#BFQ patch:
	"${_bfqpath}/0001-block-prepare-I-O-context-code-for-BFQ-v3r1-for-3.1.patch"
	"${_bfqpath}/0002-block-cgroups-kconfig-build-bits-for-BFQ-v3r1-3.1.patch"
	"${_bfqpath}/0003-block-introduce-the-BFQ-v3r1-I-O-sched-for-3.1.patch"
	#TuxOnIce:
	"http://tuxonice.net/files/${_toipatch}"
	#Arch Logo
	"logo_linux_mono.pbm"
        "logo_linux_clut224.ppm"
	"logo_linux_vga16.ppm"
	#Others:
	"license.patch"
	"semaphore.patch"
        "change-default-console-loglevel.patch"
	"i915-fix-ghost-tv-output.patch"
	"i915-fix-incorrect-error-message.patch"
	"iwlagn-fix-NULL-pointer-dereference.patch"
	"dib0700-fix.patch"
	"usb-add-reset-resume-quirk-for-several-webcams.patch"
	"md-raid10-fix-bug-when-activating-a-hot-spare.patch"
	"kernel-netbook.preset"
	"config")
	
build() {
  cd ${srcdir}/linux-$_basekernel

  # Patching Time:

  # minorversion patch:
  #patch -p1 -i "${srcdir}/patch-${pkgver}"

  # Some chips detect a ghost TV output
  # mailing list discussion: http://lists.freedesktop.org/archives/intel-gfx/2011-April/010371.html
  # Arch Linux bug report: FS#19234
  #
  # It is unclear why this patch wasn't merged upstream, it was accepted,
  # then dropped because the reasoning was unclear. However, it is clearly
  # needed.
  patch -Np1 -i "${srcdir}/i915-fix-ghost-tv-output.patch"

  # In 3.1.0, a DRM_DEBUG message is falsely declared as DRM_ERROR. This
  # worries users, as this message is displayed even at loglevel 4. Fix
  # this.
  patch -Np1 -i "${srcdir}/i915-fix-incorrect-error-message.patch"

  # iwlagn has a critical bug that hangs the system on 3.1.0. A patch
  # was posted, but didn't make it into the tree in time.
  # http://marc.info/?l=linux-wireless&m=131840748927629&w=2
  # FS#26674
  patch -Np1 -i "${srcdir}/iwlagn-fix-NULL-pointer-dereference.patch"

  # Fix dib0700 driver
  # http://git.linuxtv.org/pb/media_tree.git/shortlog/refs/heads/for_v3.0
  # FS#25939
  patch -Np1 -i "${srcdir}/dib0700-fix.patch"

  # Add the USB_QUIRK_RESET_RESUME for several webcams
  # FS#26528
  patch -Np1 -i "${srcdir}/usb-add-reset-resume-quirk-for-several-webcams.patch"

  # Fix RAID10 hot spare activation (critical)
  # https://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git;a=blob_plain;f=queue-3.1/md-raid10-fix-bug-when-activating-a-hot-spare.patch;h=880849db5b7089b523f72c4d67a473e5330037fc;hb=HEAD
  # FS#26767
  patch -Np1 -i "${srcdir}/md-raid10-fix-bug-when-activating-a-hot-spare.patch"

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
    bzip2 -dck ${srcdir}/${_toipatch} \
        | sed 's/printk(KERN_INFO "PM: Creating hibernation image:\\n/printk(KERN_INFO "PM: Creating hibernation image: \\n/' \
        | patch -Np1 -F4 || { echo "Failed TOI"; return 1 ; }
  fi

  # --> BFQ
  if [ $BFQ_IO_SCHEDULER = "y" ] ; then
    msg "Patching source with BFQ patches"
    for i in $(ls ${srcdir}/000*.patch); do
      patch -Np1 -i $i
    done
  fi


  ### Clean tree and copy ARCH config over
  msg "Running make mrproper to clean source tree"
  make mrproper

  # copy config
  cp ../config ./.config

  make prepare

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

##Section: Broadcom-wl
  #msg "Compiling broadcom-wl module:"
  #cd ${srcdir}/
  ##patching broadcom as broadcom-wl package on AUR
  #patch -p1 -i linux3.patch
  #patch -p1 -i license.patch
  #patch -p1 -i semaphore.patch
  #make -C ${srcdir}/linux-$_basekernel M=`pwd`
  #install -D -m 755 wl.ko ${pkgdir}/lib/modules/$_kernver/kernel/drivers/net/wireless/wl.ko
  
  # gzip -9 all modules to safe a lot of MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--netbook}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--netbook}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--netbook}/version"
}

package_kernel-netbook-headers() {
  KARCH=x86
  pkgdesc='Header files and scripts for building modules for kernel-netbook'

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
