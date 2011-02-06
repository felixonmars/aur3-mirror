# Contributor: Jussi Timperi <jussi.timperi at gmail dot com>

pkgname=kernel26-mike
_kernelname=${pkgname#kernel26}
_basekernel=2.6.30
_ver=${_basekernel}.6
pkgver=${_ver}p3
pkgrel=1
_patchname="mikep3-patch-${_basekernel}-gc"
pkgdesc="The Linux Kernel and modules that can run under mini for the Nintendo Wii"
arch=('ppc')
license=('GPL2')
url="http://www.kernel.org"
depends=('coreutils' 'module-init-tools')
optdepends=('openfwwf: Nintendo Wii WLAN firmware')
install=kernel26-mike.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2
        http://www.kernel.org/pub/linux/kernel/v2.6/patch-${_ver}.bz2
        http://downloads.sourceforge.net/gc-linux/${_patchname}.bz2
        config)
md5sums=('7a80058a6382e5108cdb5554d1609615'
         'f89295707f68c2b349534b490c9d5f2d'
         'ea45071943a881ed31ef098d6e1fdbeb'
         '2538949bcb366963147e38626b247413')

build() {
  KARCH=powerpc

  cd ${srcdir}/linux-$_basekernel
  patch -Np1 -i ${srcdir}/patch-${_ver} || return 1
  patch -Np1 -i ${srcdir}/${_patchname} || return 1

  cat ../config >./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  # get kernel version
  make ARCH=powerpc prepare
  _kernver="$(make ARCH=powerpc kernelrelease)"

  make ARCH=powerpc zImage modules || return 1

  mkdir -p ${pkgdir}/{lib/modules,boot}
  make ARCH=powerpc INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
  cp System.map ${pkgdir}/boot/System.map26${_kernelname}
  cp arch/$KARCH/boot/zImage ${pkgdir}/boot/zImage${_kernelname}
  install -D -m644 Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    ${pkgdir}/usr/src/linux-${_kernver}/.config
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  for i in acpi asm-{generic,powerpc} config linux math-emu media net pcmcia scsi sound trace video; do
    cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/
  done

  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/powerpc
  cp -a arch/powerpc/include ${pkgdir}/usr/src/linux-${_kernver}/arch/powerpc/

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
  cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}
  # fix permissions on scripts dir
  chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts

  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel

  cp arch/$KARCH/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

  # add headers for lirc package
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
  cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo zc0301; do
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
  # add vmlinux
  cp vmlinux ${pkgdir}/usr/src/linux-${_kernver}
  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do 
    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  done

  cd ${pkgdir}/usr/src/linux-${_kernver}/include && ln -s asm-$KARCH asm

  chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
  cd ${pkgdir}/lib/modules/${_kernver} && \
    (rm -f source build; ln -sf ../../../usr/src/linux-${_kernver} build)
  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i $startdir/kernel26-mike.install

  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,x86,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}

}
