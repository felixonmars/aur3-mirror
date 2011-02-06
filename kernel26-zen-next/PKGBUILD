# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=kernel26-zen-next
pkgver=2.6.33_rc7
_basever=2.6.33
_realver=2.6.33-rc7
_zenver=1
pkgrel=1
pkgdesc="The Linux Kernel and modules with stable ZEN patch and next ver kernel (non-git)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.kernel.org"
provides=(kernel26=${_basever})
backup=('etc/mkinitcpio.d/${pkgname}.preset' 'etc/mkinitcpio-zen-next.conf')
depends=('coreutils' 'kernel26-firmware>=2.6.31' 'module-init-tools' 'mkinitcpio>=0.5.20')
makedepend=('xz-utils')
optdepends=('crda: to set the correct wireless channels of your country')
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
          'alsa-driver' 'ieee80211' 'hostap-driver26'
          'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
          'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
          'gspcav1' 'atl2' 'wlan-ng26' 'rt2500')
install=kernel26-zen-next.install

md5sums=('905772bbff927ce20c87d86a66d01a71'
         '0dd87975c5e5db54efde3278c6de7143'
         'e646c5ee6f0fccf9682e5a22e045048f'
         '502044af2a0cf81d086d503c76dd35d6'
         'c129dd7b0e9b1e7b4168f34010a31db7'
         '15a3c890c3a986620b6117681beb916b')

### User defined variables ###
_menuconfig="1"               #
_keep_source_code="0"         #
_zen_patch="1"                #
##############################

source=(http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-${_realver}.tar.bz2
        # ZEN patch
        http://downloads.zen-kernel.org/${_basever}/${_realver}-zen${_zenver}.patch.lzma
        # configurations
        config
        config.x86_64
        ${pkgname}.preset
        mkinitcpio-${pkgname}.conf)


build() {
  KARCH=x86

  cd ${srcdir}/linux-${_realver} || return 1
  
  # Applying ZEN patch
  if [ "$_zen_patch" == "1" ]; then
     lzma -df ${srcdir}/${_realver}-zen${_zenver}.patch.lzma
     echo "Applying ${_realver}-zen${_zenver}.patch" 
     #for i in $(ls ${srcdir}/${_realver}-zen${_zenver}.patch); do
        cd ${srcdir}/linux-${_realver} || return 1
        patch -Np1 -i ${srcdir}/${_realver}-zen${_zenver}.patch || return 1
     #done
  fi

  # remove extraversion
  sed -i 's|^EXTRAVERSION = .*$|EXTRAVERSION =|g' Makefile

  # load configuration for i686 or x86_64
  if [ "$CARCH" = "x86_64" ]; then
     cat ../config.x86_64 > ./.config
  else
     cat ../config > ./.config
  fi

  # get kernel version
  make prepare
  _kernver="$(make kernelrelease)"

  # configure kernel    
  if [ "$_menuconfig" = "1" ]; then
     make menuconfig
  fi
  yes "" | make config

  # fuck CONFIG_LOCALVERSION_AUTO!
  sed -i 's|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|' .config

  if [ "$_keep_source_code" = "1" ]; then
     echo -n "Copying source code..."
     # Keep the source code   
     cd ${startdir} || return 1
     mkdir -p ${pkgdir}/usr/src || return 1
     cp -a ${srcdir}/linux-${_realver} ${pkgdir}/usr/src/linux-${_kernver} || return 1
	
     #Add a link from the modules directory
     mkdir -p ${pkgdir}/lib/modules/${_kernver} || return 1
     cd ${pkgdir}/lib/modules/${_kernver} || return 1
     rm -f source
     ln -s ../../../usr/src/linux-${_kernver} source || return 1
     echo "OK"
  fi

  cd ${srcdir}/linux-${_realver}
  # build kernel
  make bzImage modules || return 1
  mkdir -p ${pkgdir}/{lib/modules,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
  install -D -m644 System.map ${pkgdir}/boot/System.map26-zen-next
  install -D -m644 arch/${KARCH}/boot/bzImage ${pkgdir}/boot/vmlinuz26-zen-next
  install -D -m644 Makefile ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config ${pkgdir}/usr/src/linux-${_kernver}/.config
  install -D -m644 .config ${pkgdir}/boot/kconfig26-zen-next
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include
    
  for i in acpi asm-{generic,${KARCH}} config linux math-emu media net pcmcia scsi sound trace video; do
     cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/	      
  done
    
  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}	
  cp -a arch/${KARCH}/include ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/

  # copy files ssary for later builds, like nvidia and vmware
  cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
  cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}

  # fix permissions on scripts dir
  chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts

  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel

  cp arch/${KARCH}/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/
  if [ "${CARCH}" = "i686" ]; then
     cp arch/${KARCH}/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/
  fi
  cp arch/${KARCH}/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel/
    
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

  # add xfs and shmem for aufs building
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
  cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h

  # add headers vor virtualbox
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/drm ${pkgdir}/usr/src/linux-${_kernver}/include/

  # add headers for broadcom wl
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/trace ${pkgdir}/usr/src/linux-${_kernver}/include/

  # add vmlinux
  cp vmlinux ${pkgdir}/usr/src/linux-${_kernver}

  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do 
     mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
     cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  done

  cd ${pkgdir}/usr/src/linux-${_kernver}/include && ln -s asm-${KARCH} asm

  # add header for aufs2-util
  cp -a ${srcdir}/linux-${_realver}/include/asm-generic/bitsperlong.h ${pkgdir}/usr/src/linux-${_kernver}/include/asm/

  chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
  cd ${pkgdir}/lib/modules/${_kernver} && (rm -f source build; ln -sf ../../../usr/src/linux-${_kernver} build)

  # install fallback mkinitcpio-kernel26-zen.conf file and preset file for kernel
  install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset || return 1
  install -m644 -D ${srcdir}/mkinitcpio-${pkgname}.conf ${pkgdir}/etc/mkinitcpio-zen-next.conf || return 1

  # set correct depmod command for install
  sed \
     -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${pkgname}/g" \
     -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
     -i ${startdir}/${pkgname}.install
  sed \
     -e "s|source .*|source /etc/mkinitcpio.d/${pkgname}.kver|g" \
     -e "s|default_image=.*|default_image=\"/boot/${pkgname}.img\"|g" \
     -e "s|fallback_image=.*|fallback_image=\"/boot/${pkgname}-fallback.img\"|g" \
     -i ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${pkgname}.kver

  if [ "$_keep_source_code" = "0" ]; then
     # remove unneeded architectures   
     rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
  fi

  # Delete firmware directory
  rm -rf ${pkgdir}/lib/firmware
}
