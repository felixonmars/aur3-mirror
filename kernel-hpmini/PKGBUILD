# Maintainer: Dieghen89 <dieghen89@gmail.com>

SPLITTED=y
if [ $SPLITTED = "y" ] ; then
  pkgbase=kernel-hpmini
  pkgname=('kernel-hpmini' 'kernel-hpmini-headers')
else
  pkgname="kernel-hpmini"
fi

pkgver=2.6.36
pkgrel=2
_kernver="$pkgver-hpmini"
arch=('i686')
license=('GPL2')
url=('http://www.kernel.org/')

source=("http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.36.tar.bz2"
	"config-hpmini")
md5sums=('61f3739a73afb6914cb007f37fb09b62'
         'f5c7063383e1b7f0997caa0a848b7e62')

	
build() {
  mv ${srcdir}/linux-$pkgver ${srcdir}/linux-$_kernver
  cd ${srcdir}/linux-$_kernver

  # copy config
  cp ../config-hpmini ./.config
 
  # make defconfig
  # configure kernel    
  # use menuconfig, if you want to change the configuration
  make menuconfig
  # make gconfig
  # yes "" | make config

  # build kernel
  make
}

package_kernel-hpmini() {
  pkgdesc="Static kernel with KMS for hpminis with Intel Atom N270/N280/N450 such as eeepc with the add-on of external firmware (broadcom-wl, stk11xx) - Old kernel26-901 - Only Intel graphic card - Give more power to your hpmini!"
  depends=('coreutils' 'module-init-tools')
  conflicts=()
  provides=()
  install=kernel-hpmini.install

  cd ${srcdir}/linux-$_kernver
  # install our modules
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install
  
  # remove the junk symlinks
  rm -r $pkgdir/lib/modules/$_kernver/{source,build}

  # install the kernel
  install -D -m644 ${srcdir}/linux-$_kernver/System.map $pkgdir/boot/System.map-hpmini
  install -D -m644 ${srcdir}/linux-$_kernver/arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz-hpmini
  install -D -m644 ${srcdir}/linux-$_kernver/.config $pkgdir/boot/kconfig-hpmini

  # set correct depmod command for install
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/$pkgname.install
}

package_kernel-hpmini-headers() {
  KARCH=x86
  if [ $SPLITTED = "y" ] ; then
    pkgdesc="Header files and scripts for building modules for kernel-hpmini"
  fi
  cd ${srcdir}/linux-$_kernver
  mkdir -p ${pkgdir}/lib/modules/${_kernver}
  cd ${pkgdir}/lib/modules/${_kernver}
  ln -sf ../../../usr/src/linux-${_kernver} build
  cd ${srcdir}/linux-$_kernver
  install -D -m644 Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    ${pkgdir}/usr/src/linux-${_kernver}/.config
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  for i in acpi asm-generic config generated linux math-emu media net pcmcia scsi sound trace video; do
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
  cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  # add headers for lirc package
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
  cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo; do
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
  cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
  done

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
  mkdir -p $pkgdir/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core
  cp drivers/media/dvb/dvb-core/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/
  mkdir -p $pkgdir/usr/src/linux-${_kernver}/include/config/dvb
  cp include/config/dvb/*.h $pkgdir/usr/src/linux-${_kernver}/include/config/dvb
  mkdir -p $pkgdir/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  cp drivers/media/dvb/frontends/lgdt330x.h $pkgdir/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  cp drivers/media/video/msp3400-driver.h $pkgdir/usr/src/linux-${_kernver}/drivers/media/dvb/frontends

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
  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do 
    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  done

  chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}
