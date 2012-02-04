# Maintainer: Manuel Gaul <inkaine (at) hotmail (dot) com>
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>

pkgname=kernel26-one-dev
_basekernel=2.6.39
pkgver=${_basekernel}.1
pkgrel=2
_kernelname=${pkgname#kernel26}
_basepkgrel=1
_patchname="patch-${pkgver}-${_basepkgrel}-ARCH"
pkgdesc="The Linux Kernel instable development version for the Acer Aspire One A110L"
arch=('i686')
license=('GPL2')
url="http://www.kernel.org"
groups=(one)
depends=('coreutils' 'linux-firmware' 'module-init-tools')
makedepends=('gcc>=4.5')
install=kernel26-one-dev.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2
	ftp://ftp.archlinux.org/other/kernel26/${_patchname}.bz2
	config)
md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         '195dc2d9a79d497d81c0ae187cb679fb'
	 '12fa297a2d70bf286c5a4fec31492fb1')

build() {
   # if the user hasn't set his makepkg.conf
   export CFLAGS="-march=atom -Os -pipe -fomit-frame-pointer"
   export CXXFLAGS="${CFLAGS}"
   export MAKEFLAGS="-j3"
   export CARCH="i686"

   export KARCH="x86"

   # get into the linux source directory and start some magic
   cd ${srcdir}/linux-$_basekernel

   # Add -ARCH patches
   # See http://projects.archlinux.org/git/?p=linux-2.6-ARCH.git;a=summary
   patch -Np1 -i ${srcdir}/${_patchname} || return 1

   # remove the extraversion from Makefile
   sed -i 's|^EXTRAVERSION = .*$|EXTRAVERSION =|g' Makefile

   echo load configuration
   cp ../config ./.config

   # set kernel version libpath to basekernel
   . ./.config
   export _kernver="${_basekernel}${CONFIG_LOCALVERSION}"
   make silentoldconfig
   # Uncomment to configure the kernel!
#  return 1
   echo making the kernel!
   make bzImage modules || return 1
}

package() {
   cd ${srcdir}/linux-${_basekernel}

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
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/kernel26-one-dev.install

  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa} 

  # remove build and source links
  rm -f ${pkgdir}/lib/modules/${_kernver}/build
  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware
}
