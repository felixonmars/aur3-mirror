# $Id$
# Maintainer: Moritz Rudert <helios@cyb0rg.org>
_idstr="xen-dom0"
pkgname=kernel26-xen-dom0
_basekernel=2.6.32
_kernelname=${pkgname#kernel26}
pkgver=2.6.32.15
pkgrel=2
pkgdesc="The Linux Vanilla Kernel and modules with XEN patches. Dev-Version"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.kernel.org"
backup=(etc/mkinitcpio.d/${pkgname}.preset)
depends=('coreutils' 'linux-firmware' 'module-init-tools' 'mkinitcpio>=0.5.20')
# pwc, ieee80211 and hostap-driver26 modules are included in kernel26 now
# nforce package support was abandoned by nvidia, kernel modules should cover everything now.
# kernel24 support is dropped since glibc24
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
          'alsa-driver' 'ieee80211' 'hostap-driver26'
          'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
          'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
          'gspcav1' 'atl2' 'wlan-ng26' 'rt2500' 'nouveau-drm')
install=kernel26.install
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${pkgver}.tar.bz2 config.xen config.xen.x86_64 config config.x86_64 ${pkgname}.preset http://gentoo-xen-kernel.googlecode.com/files/xen-patches-2.6.32-2.tar.bz2 microcode_core-xen.patch)
optdepends=('crda: to set the correct wireless channels of your country')
md5sums=('1cbbf16e93bbe03368172872690600c0'
         '48f263f497ffb4ec0d93290ced43373c'
         'f3614307c145fb8edf86f2a57b986632'
         'c114c5d89622a93165bb948d62d966b5'
         '5c91374d56f115ba4324978d5b002711'
         '5a6aadecb5be434e495143794a7d2b1e'
         'd1d78d2e9b9b62dd869a490f4415de04'
         '6360a3a591d212114aa4d45babe18249')

build() {
  KARCH=x86

  cd ${srcdir}/linux-${pkgver}

  for i in `ls ../6*.patch* | sort`
  do
    patch -p1 -s -i $i
    if [ $? = 0 ]; then
      echo "$i applied"
    else
      echo "Error processing $i"
      exit 1
    fi
  done

  patch -p1 -s -i ../microcode_core-xen.patch || return 1

  make mrproper

  if [ "$CARCH" = "x86_64" ]; then
    cat ../config.x86_64 >./.config
    cat ../config.xen.x86_64 >>./.config
  else
    cat ../config >./.config
    cat ../config.xen >>./.config
  fi
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  # get kernel version  
  make prepare
  _kernver="$(make kernelrelease)"
  # load configuration
  yes "" | make oldconfig
  # build!
  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################
  make || return 1
  make modules || return 1
  mkdir -p ${pkgdir}/{lib/modules,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
  cp System.map ${pkgdir}/boot/System.map26-${_idstr}
  cp arch/$KARCH/boot/vmlinuz ${pkgdir}/boot/vmlinuz26-${_idstr}
  install -D -m644 Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile \
    ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    ${pkgdir}/usr/src/linux-${_kernver}/.config
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  for i in acpi asm-{generic,x86} config linux math-emu media net pcmcia scsi sound video trace drm xen; do
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
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo zc0301; do
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
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
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
  # install fallback mkinitcpio.conf file and preset file for kernel
  install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset || return 1
  # set correct depmod command for install
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/kernel26.install
  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${startdir}/pkg/etc/mkinitcpio.d/${pkgname}.kver
  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware
}
