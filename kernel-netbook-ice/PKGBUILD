# Maintainer: Balor <dieghen89@gmail.com>

BFQ_IO_SCHEDULER="y"
TUX_ON_ICE="y"

pkgname=kernel-netbook-ice
true && pkgname=('kernel-netbook-ice' 'kernel-netbook-headers-ice')
depends=('coreutils' 'module-init-tools')
makedepends=('dmidecode' 'xmlto' 'docbook-xsl')
optdepends=('hibernate-script: tux on ice default script' 'tuxonice-userui: graphical interface for toi [AUR]')
_basekernel=2.6.38
pkgver=${_basekernel}.8
pkgrel=1
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) and patchset (BFS + TOI + BFQ optional) - Only Intel GPU - Give more power to your netbook!"
options=(!strip)
arch=('i686')
license=('GPL2')
url=('http://code.google.com/p/kernel-netbook')

####################################

###################################
#  external drivers  and firmware #
###################################

#Arch patchset
patchname=patch-${pkgver}-1-ARCH
#Broadcom-wl:
broadcom_ver=5.100.82.38
broadcom="hybrid-portsrc_x86_32-v${broadcom_ver//./_}"
#Stk11xx:
#stk11xx_ver="2.1.0"
#stk11xx="stk11xx-$stk11xx_ver"
#BFS: - http://users.on.net/~ckolivas/kernel/ -
_ckpatchversion=3
_ckpatchname="patch-${_basekernel}-ck${_ckpatchversion}"
#BFQ: - http://algo.ing.unimo.it/people/paolo/disk_sched/ -
_bfqpatchversion="2"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/2.6.38"
#TuxOnIce:
_toipatch="tuxonice-3.2-for-2.6.38.patch.bz2"

##### Sources #####
source=( #kernel sources and arch patchset
	"ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2"
	"ftp://ftp.archlinux.org/other/kernel26/${patchname}.bz2"
	#external drivers:
	"http://www.broadcom.com/docs/linux_sta/${broadcom}.tar.gz"
	#"http://switch.dl.sourceforge.net/sourceforge/syntekdriver/stk11xx-$stk11xx_ver.tar.gz"
	#BFS patch:
	"http://www.kernel.org/pub/linux/kernel/people/ck/patches/2.6/${_basekernel}/${_basekernel}-ck${_ckpatchversion}/${_ckpatchname}.bz2"
	"http://ck.kolivas.org/patches/bfs/bfs400-bfs401.patch"
	#BFQ patch:
	"${_bfqpath}/0001-block-prepare-I-O-context-code-for-BFQ-v2-for-2.6.38.patch"
	"${_bfqpath}/0002-block-cgroups-kconfig-build-bits-for-BFQ-v2-2.6.38.patch"
	"${_bfqpath}/0003-block-introduce-the-BFQ-v2-I-O-sched-for-2.6.38.patch"
	#TuxOnIce:
	http://www.tuxonice.net/files/${_toipatch}
	#Others:
	"config"
	"license.patch"
	"semaphore.patch"
	"mutex-sema.patch"
	"kernel-netbook-ice.preset")
	
build() {

  cd ${srcdir}/linux-$_basekernel

  # patching the kernel with:
  # --> arch patchset
  msg "Patching source with Arch Official Patchset:"
  patch -Np1 -i ${srcdir}/$patchname

  # --> BFS
  msg "Patching source with BFS patch:"
  #Adjust localversion
  sed -i -e "s/-ck${_ckpatchversion}//g" ${srcdir}/${_ckpatchname}
  #patching time
  patch -Np1 -i ${srcdir}/${_ckpatchname}
  msg "Patching source with bfs363-test2 patch"
  msg "For details, see: http://ck-hack.blogspot.com/2011/03/bfs-and-optimising-global-scheduler-for.html"
  sleep 2s
  patch -Np1 -i ${srcdir}/bfs400-bfs401.patch

  # --> TOI
  if [ $TUX_ON_ICE = "y" ] ; then
    msg "Patching source with TuxOnIce patch"
    bzip2 -dck ${srcdir}/${_toipatch} \
		| sed 's/printk(KERN_INFO "PM: Creating hibernation image:\\n/printk(KERN_INFO "PM: Creating hibernation image: \\n/' \
		| patch -Np1 -F4 || return 1
  fi
  # copy config
  cp ../config ./.config
  # --> BFQ
  if [ $BFQ_IO_SCHEDULER = "y" ] ; then
    msg "Patching source with BFQ patches"
    for i in $(ls ${srcdir}/000*.patch); do
      patch -Np1 -i $i
    done
    #sed -i s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set/g' ${srcdir}/linux-$_basekernel/.config
    #sed -i s'/\# CONFIG_DEFAULT_BFQ is not set/CONFIG_DEFAULT_BFQ=y/g' ${srcdir}/linux-$_basekernel/.config
    #sed -i s'/CONFIG_DEFAULT_IOSCHED=*/CONFIG_DEFAULT_IOSCHED="bfq"/g' ${srcdir}/linux-$_basekernel/.config
  fi



  make prepare

  # make defconfig
  # configure kernel    
  # use menuconfig, if you want to change the configuration
  make menuconfig
  # make gconfig
  yes "" | make config
  # build kernel
  msg "Now starts something magic:"
  make ${MAKEFLAGS} bzImage modules
}

package_kernel-netbook-ice() {
  pkgdesc='Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) - Only Intel GPU - Give more power to your netbook!'
  depends=('coreutils' 'module-init-tools')
  install=kernel-netbook-ice.install
  optdepends=('crda: for wireless regulatory domain support' 'linux-firmware: firmware for rt2860 and tigon3')
  groups=(eee)

  cd ${srcdir}/linux-$_basekernel
  # install our modules
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install
  
  # Get kernel version
  _kernver="$(make kernelrelease)"

  # remove the junk symlinks
  rm -r $pkgdir/lib/modules/$_kernver/{source,build}
  
  # remove the firmware directory
  rm -rf ${pkgdir}/lib/firmware

  # install the kernel
  install -D -m644 ${srcdir}/linux-$_basekernel/System.map $pkgdir/boot/System.map-netbook-ice
  install -D -m644 ${srcdir}/linux-$_basekernel/arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz-netbook-ice
  install -D -m644 ${srcdir}/linux-$_basekernel/.config $pkgdir/boot/kconfig-netbook-ice

  # install preset file for mkinitcpio
  sed -i -e "s/ALL_kver=.*/ALL_kver=\'${_kernver}\'/g" $startdir/$pkgname.preset
  install -m644 -D ${srcdir}/kernel-netbook-ice.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

  # set correct depmod command for install
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/$pkgname.install

##Section: Broadcom-wl
  msg "Compiling broadcom-wl module:"
  cd ${srcdir}/
  #patching broadcom as broadcom-wl package on AUR
  patch -p1 < license.patch
  patch -p1 < semaphore.patch
  patch -p1 < mutex-sema.patch
  make -C ${srcdir}/linux-$_basekernel M=`pwd`
  install -D -m 755 wl.ko ${pkgdir}/lib/modules/$_kernver/kernel/drivers/net/wireless/wl.ko
  
##Section: stk11xx
  #msg "Compiling stk11xx module:"
  #cd $srcdir/stk11xx-$stk11xx_ver
  #make -C $srcdir/linux-${_basekernel}/ SUBDIRS=$srcdir/stk11xx-2.1.0 modules
  #install -D -m 644 $srcdir/stk11xx-$stk11xx_ver/stk11xx.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/media/video
  #install -D -m 644 $srcdir/stk11xx-$stk11xx_ver/README $pkgdir/usr/share/stk11xx.readme

  # gzip -9 all modules to safe a lot of MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

package_kernel-netbook-headers-ice() {
  KARCH=x86
  pkgdesc='Header files and scripts for building modules for kernel-netbook'
  mkdir -p ${pkgdir}/lib/modules/${_kernver}
  cd ${pkgdir}/lib/modules/${_kernver}
  ln -sf ../../../usr/src/linux-${_kernver} build
  cd ${srcdir}/linux-$_basekernel
  install -D -m644 Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    ${pkgdir}/usr/src/linux-${_kernver}/.config
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  for i in acpi asm-generic config generated linux math-emu media net pcmcia scsi sound trace video xen; do
    cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/
  done

  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/x86
  cp -a arch/x86/include ${pkgdir}/usr/src/linux-${_kernver}/arch/x86/

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
  cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}
  # fix permissions on scripts dir
  chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions

  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel

  cp arch/$KARCH/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  if [ "$CARCH" = "i686" ]; then
    cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  fi
  cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

  # add headers for lirc package
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
  cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102; do
   mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
   cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
  done
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/staging/usbvideo/
  cp -a drivers/staging/usbvideo/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/staging/usbvideo/
  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile
  # add dm headers
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
  cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
  # add inotify.h
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
  cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/
  # add wireless headers
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  cp net/mac80211/*.h ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core
  cp drivers/media/dvb/dvb-core/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/
  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/11194
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  cp drivers/media/dvb/frontends/lgdt330x.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  cp drivers/media/video/msp3400-driver.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  # add dvb headers  
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb
  cp drivers/media/dvb/dvb-usb/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends
  cp drivers/media/dvb/frontends/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners
  cp drivers/media/common/tuners/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/
  # add xfs and shmem for aufs building
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
  cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h
  # add headers vor virtualbox
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/drm $pkgdir/usr/src/linux-${_kernver}/include/
  # add headers for broadcom wl
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/trace $pkgdir/usr/src/linux-${_kernver}/include/
  # add headers for crypto modules
  # in reference to:
  # http://bugs.archlinux.org/task/22081
  cp -a include/crypto $pkgdir/usr/src/linux-${_kernver}/include/
  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do 
    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  done

  chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
  # strip scripts directory
  find ${pkgdir}/usr/src/linux-${_kernver}/scripts  -type f -perm -u+w 2>/dev/null | while read binary ; do
  case "$(file -bi "$binary")" in
    *application/x-sharedlib*) # Libraries (.so)
    /usr/bin/strip $STRIP_SHARED "$binary";;
    *application/x-archive*) # Libraries (.a)
    /usr/bin/strip $STRIP_STATIC "$binary";;
    *application/x-executable*) # Binaries
    /usr/bin/strip $STRIP_BINARIES "$binary";;
    esac 
  done 
  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}

sha256sums=('72f0cfaefb8dc86b219d5a742dd0375332627641ecbdf5badd3158e2127b9304'
            'cfa1bbe81a6734a2c9ed9b224468fcac32be1316c986646c56627e2580301b39'
            'f736af1da2fa05fb65d8e919b3eb0116eb5ef47e4acc14f5a2adc4bac1b4fb37'
            'c20587e76a9c758852c2af01ffaed15e91016be56cbce60754150d26c6fbd78f'
            '13ebbb28af179e6c7d122644bcd06409fd5741baa277b9cc75a4d9905764918c'
            'dc2be48efa5c07828d14a5eac9a75b2672c37cf87d100712230c9e2d35fd57ab'
            '6b1e3ac9073534367649bdef7c4461c9af872c60f065ac6f0d2eaf4ee3fa02fb'
            '69fc12e6b2178b307e1d191fe85c937a68808a94eefea3ee5c069f63d960d121'
            'b3728a7c473d9291901a434363aa2033cf00937ca223768fc605059dd772b50e'
            'bb2aad665b4cd7fc039c69899bce340bb90692fd35cf28d7686db488a9f80b57'
            'd0fed526ae8406dbb1aefa8ffe9f84e1eae5930a1e5e746bae3fcdb57a4dc101'
            '7901ab87bddb6497e93d1f94c32bc9d94bd7db3312c065281d703c6989638fab'
            '7855168a9b4bdb6943310bf167f71e36e17c80513a918c12b5d12c6adf881753'
            '9e601e5f40720b888ca7cfae8c44e365e6b4073da286bec6c5c7f7191a1c56fb')
