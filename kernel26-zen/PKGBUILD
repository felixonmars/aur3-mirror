# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=kernel26-zen
pkgver=2.6.35.4
_basever=2.6.35
_zenver=2
_archver=1
pkgrel=1
pkgdesc="The Linux Kernel and modules with stable ZEN patch (non-git)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://zen-kernel.org"
provides=(kernel26=${pkgver})
backup=('etc/mkinitcpio.d/${pkgname}.preset' 'etc/mkinitcpio.d/${pkgname}-fallback.conf' 'etc/mkinitcpio-zen.conf')
depends=('coreutils' 'linux-firmware' 'module-init-tools' 'mkinitcpio')
makedepends=('xz-utils')
optdepends=('crda: to set the correct wireless channels of your country')
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
          'alsa-driver' 'ieee80211' 'hostap-driver26'
          'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
          'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
          'gspcav1' 'atl2' 'wlan-ng26' 'rt2500')
install=kernel26-zen.install

### User defined variables ####
_menuconfig="0"				  #
_keep_source_code="0"		  #
_zen_patch="1"				  #
_arch_patch="0"               #
###############################

source=(http://www.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
        # ZEN patches
        http://downloads.zen-kernel.org/${_basever}/${_basever}-zen${_zenver}.patch.lzma
        #ftp://ftp.archlinux.org/other/kernel26/patch-${pkgver}-${_archver}-ARCH.bz2
        # configurations
        config
        config.x86_64
        ${pkgname}.preset
        mkinitcpio-${pkgname}.conf)

md5sums=('091abeb4684ce03d1d936851618687b6'
         '5660693904a433e6329f06187e7d21cc'
         '60a61d5a5dc1f11bb23c031db06c60ba'
         '4a496d5ee8025f123a4be6d3184cf2b9'
         '0ab28c6ef83545539d7282fd1e249d00'
         'deeade3bcf70f4a13beeca6c3287c7ca')

build() {
  KARCH=x86

  cd ${srcdir}/linux-${_basever} || return 1

  # Applying ZEN patch
  if [ "$_zen_patch" == "1" ]; then
		echo "Applying ${_basever}-zen${_zenver}.patch"
		lzma -df ${srcdir}/${_basever}-zen${_zenver}.patch.lzma
		cd ${srcdir}/linux-${_basever} || return 1
		patch -Np1 -i ${srcdir}/${_basever}-zen${_zenver}.patch || return 1
  fi

	# Applying ZEN drm-next patch
	if [ "$_arch_patch" == "1" ]; then
		echo "Applying patch-${pkgver}-${_archver}-ARCH"
		cd ${srcdir}/linux-${_basever} || return 1
		patch -Np1 -i ${srcdir}/patch-${pkgver}-${_archver}-ARCH || return 1
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
     cp -a ${srcdir}/linux-${_basever} ${pkgdir}/usr/src/linux-${_kernver} || return 1
	
     #Add a link from the modules directory
     mkdir -p ${pkgdir}/lib/modules/${_kernver} || return 1
     cd ${pkgdir}/lib/modules/${_kernver} || return 1
     rm -Rf source
     ln -s ../../../usr/src/linux-${_kernver} source || return 1
     echo "OK"
  fi

  cd ${srcdir}/linux-${_basever}
  # build kernel
  make bzImage modules || return 1
  mkdir -p ${pkgdir}/{lib/modules,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
  install -D -m644 System.map ${pkgdir}/boot/System.map26-zen
  install -D -m644 arch/${KARCH}/boot/bzImage ${pkgdir}/boot/vmlinuz26-zen
  install -D -m644 Makefile ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config ${pkgdir}/usr/src/linux-${_kernver}/.config
  install -D -m644 .config ${pkgdir}/boot/kconfig26-zen
  install -D -m644 vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  #install teh headers!

  mkdir -p ${pkgdir}/lib/modules/${_kernver}
  cd ${pkgdir}/lib/modules/${_kernver}
  rm -f source build
  ln -sf ../../../usr/src/linux-${_kernver} build
  cd ${srcdir}/linux-$_basever
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

  # install fallback mkinitcpio-kernel26-zen.conf file and preset file for kernel
  install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset || return 1
  install -m644 -D ${srcdir}/mkinitcpio-${pkgname}.conf ${pkgdir}/etc/mkinitcpio-zen.conf || return 1

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
