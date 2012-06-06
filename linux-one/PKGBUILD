# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

# Contributor: Manuel Gaul <inkaine (at) hotmail (dot) com>
# Contributor: Joao Rodrigues <gothicknight (at) gmail (dot) com>
# Original PKGBUILD: Andreas Radke <andyrtr (at) archlinux (dot) org>

pkgname=linux-one
_basekernel=3.4
pkgver=${_basekernel}.1
pkgrel=1
_kernelname=${pkgname#linux}
pkgdesc="The Linux Kernel for the Acer Aspire One A110L"
arch=('i686')
license=('GPL2')
url="http://www.kernel.org"
groups=(one)
depends=('coreutils' 'linux-firmware' 'module-init-tools')
makedepends=('gcc>=4.5')
provides=('kernel26-one')
conflicts=('kernel26-one')
replaces=('kernel26-one')
install=linux-one.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v3.0/linux-$_basekernel.tar.bz2
ftp://ftp.kernel.org/pub/linux/kernel/v3.0/patch-${pkgver}.bz2
'config'
fix-acerhdf-1810T-bios.patch
i915-fix-ghost-tv-output.patch
change-default-console-loglevel.patch)

md5sums=('146af0160fc7a60cf9acf44aec13482b'
'7cf316c7fca8f31e584c65fa1e19517c'
'56010370f76670d5c4c11d4af4f3921e'
'3cb9e819538197398aad5db5529b22d6'
'342071f852564e1ad03b79271a90b1a5'
'9d3c56a4b999c8bfbd4018089a62f662')

build() {
	  # if the user hasn't set his makepkg.conf
	  export CFLAGS="-march=atom -Os -pipe -fomit-frame-pointer"
	  export CXXFLAGS="${CFLAGS}"
	  export MAKEFLAGS="-j3"
	  export CARCH="i686"

	  export KARCH="x86"

	  # get into the linux source directory and start some magic
	  cd ${srcdir}/linux-${_basekernel}

	  patch -p1 -i ${srcdir}/patch-${pkgver} || return 1

	  # fix #19234 i1915 display size
	  # Some chips detect a ghost TV output
	  # mailing list discussion: http://lists.freedesktop.org/archives/intel-gfx/2011-April/010371.html
	  # Arch Linux bug report: FS#19234
	  #
	  # It is unclear why this patch wasn't merged upstream, it was accepted,
	  # then dropped because the reasoning was unclear. However, it is clearly
	  # needed.
	  patch -Np1 -i "${srcdir}/i915-fix-ghost-tv-output.patch"

	  # Patch submitted upstream, waiting for inclusion:
	  # https://lkml.org/lkml/2012/2/19/51
	  # add support for latest bios of Acer 1810T acerhdf module
	  patch -Np1 -i "${srcdir}/fix-acerhdf-1810T-bios.patch"

	  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	  # remove this when a Kconfig knob is made available by upstream
	  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

	  # remove the extraversion from Makefile
	  sed -i 's|^EXTRAVERSION = .*$|EXTRAVERSION =|g' Makefile

	  # Again, using the great kernel config file from http://thibm.free.fr/
	  echo load configuration
	  cp ../config ./.config

	  # set kernel version libpath to basekernel
	  . ./.config
	  make silentoldconfig
	  # Uncomment to configure the kernel!
	  # return 1
	  echo making the kernel!
	  make bzImage modules || return 1
}

package() {
	  cd ${srcdir}/linux-${_basekernel}

	  KARCH="x86"

	  # get kernel version
	  _kernver="$(make kernelrelease)"

	  mkdir -p ${pkgdir}/{lib/{firmware,modules},boot}
	  # install our modules
	  make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
	  # install the kernel
	  install -T System.map ${pkgdir}/boot/System.map${_kernelname}
	  install -T arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz${_kernelname}

	  # We need a decent /usr/src to build modules, so

	  install -D -m644 Makefile \
		    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
	  install -D -m644 kernel/Makefile \
		    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
	  install -D -m644 .config \
		    ${pkgdir}/usr/src/linux-${_kernver}/.config
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

	  for i in acpi asm-generic config linux math-emu media net pcmcia scsi sound video; do
		    cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/
	  done

	  # copy files necessary for later builds, like nvidia and vmware
	  cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
	  cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}
	  # fix permissions on scripts dir
	  chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts
	  #mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions

	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel

	  cp arch/$KARCH/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
	  if [ "$CARCH" = "i686" ]; then
		    cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
	  fi
	  cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

	  # add headers for lirc package
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
	  cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
	  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 uvc; do
		    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
		    cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
	  done
	  # add dm headers
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	  cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	  # add inotify.h
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
	  cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/
	  # add CLUSTERIP file for iptables
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/ipv4/netfilter/
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
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux/dvb/
	  cp include/linux/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/dvb/
	  # add xfs and shmem for aufs building
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
	  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
	  cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h
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
	  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/linux-one.install

	  # remove unneeded architectures
	  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa} 

	  # remove build and source links
	  rm -f ${pkgdir}/lib/modules/${_kernver}/build
	  # remove the firmware
	  rm -rf ${pkgdir}/lib/firmware
}
