# Maintainer: OK <ok100.ok100.ok100@gmail.com>
# Based on kernel-eee PKGBUILD by Dan McGee <dan@archlinux.org>

# AUR workaround
pkgname="kernel-eee-ck"

true && pkgname=("kernel-eee-ck" "kernel-eee-ck-headers")
pkgver=2.6.39.3
_kernver=2.6.39
_ckver=ck2
pkgrel=1
pkgdesc="The Linux Kernel and modules for the Asus Eee PC 701, with Brain Fuck Scheduler v0.406 and all the goodies in the $_ckver patchset."
arch=('i686')
license=('GPL2')
url="http://www.kernel.org"
depends=('coreutils' 'module-init-tools')
optdepends=('crda: for wireless regulatory domain support'
            'iw: for wireless configuration support')
replaces=('linux-uvc-eee-svn' 'madwifi-eee-svn')
install=kernel-eee-ck.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2
        http://www.kernel.org/pub/linux/kernel/people/ck/patches/2.6/$_kernver/$_kernver-$_ckver/patch-$_kernver-$_ckver.bz2
        61-eee-ssd.rules
        kernelconfig
        fix_ck2.patch)

build() {
  # Hador's fix for 2.6.39.3/init/calibrate.c
  patch -N -i ../fix_ck2.patch

  # get into the linux source directory and start some magic
  cd $srcdir/linux-$pkgver

  # apply ck patch
  patch -Np1 -i ../patch-$_kernver-$_ckver

  # load configuration and build kernel + modules
  cp ../kernelconfig ./.config
  make silentoldconfig

  # to modify kernel settings, uncomment the following line
  #make menuconfig

  make || return 1
}

package_kernel-eee-ck() {
  # install our modules
  cd $srcdir/linux-$pkgver
  mkdir -p $pkgdir/{lib/modules,boot}
  make INSTALL_MOD_PATH=$pkgdir modules_install || return 1

  # remove the junk symlinks
  cd $srcdir/linux-$pkgver
  rm $pkgdir/lib/modules/${pkgver}-${_ckver}eee/{build,source}
  # install the kernel
  cp System.map $pkgdir/boot/System.map.eee-ck
  cp arch/x86/boot/bzImage $pkgdir/boot/vmlinuzeee-ck
  # install a helper file for all install scripts
  mkdir -p $pkgdir/usr/share/kernel-eee-ck/
  echo "KERNEL_VERSION='${pkgver}-${_ckver}eee'" > $pkgdir/usr/share/kernel-eee-ck/currver

  # udev rules for SSD drives
  mkdir -p $pkgdir/lib/udev/rules.d/
  install -m644 $srcdir/61-eee-ssd.rules $pkgdir/lib/udev/rules.d/
}

package_kernel-eee-ck-headers() {
  KARCH=x86

  # AUR workaround
  true && pkgdesc='Header files and scripts for building modules for kernel-eee-ck'

  mkdir -p ${pkgdir}/lib/modules/${pkgver}-${_ckver}eee
  cd ${pkgdir}/lib/modules/${pkgver}-${_ckver}eee
  ln -sf ../../../usr/src/linux-${_kernver} build
  cd ${srcdir}/linux-$pkgver
  install -D -m644 Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    ${pkgdir}/usr/src/linux-${_kernver}/.config
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  for i in acpi asm-generic config crypto drm generated linux math-emu \
    media net pcmcia scsi sound trace video xen; do
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

md5sums=('5afede829846587e798f2631c2ece84f'
         'ffa0384d5a243d17ca47c9bd0e2217e7'
         '73a20e8bf2bb29ba342f43460c6291cb'
         '53de82f212882bc90c2648b413f63139'
         '0ab7720f0d80d142a280cfe35b9a8730')
