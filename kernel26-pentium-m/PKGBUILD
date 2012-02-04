# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>
# Contributor: Nuno Aniceto aka quarkup <nuno.aja@gmail.com>

# Maintainer: nem <nem@ikitten.co.uk>
#
# >> for more info, check the archlinux forum :: http://bbs.archlinux.org/viewtopic.php?id=87274
# >> this package can be found at the AUR     :: http://aur.archlinux.org/packages.php?ID=33104
#
# >> this package solves the intel cpufreq's module problem for pentium-m processors (sonoma, dothan and other models)

pkgbase='kernel26-pentium-m'
pkgname="${pkgbase}" # double $pkgname referencing to avoid split-pkg problems with AUR

# this is a split PKGBUILD
[[ "${pkgname}" == 'kernel26-pentium-m' ]] && pkgname=("${pkgbase}" "${pkgbase}-headers")

pkgdesc='The ZEN (or ARCH by choice) Linux Kernel and modules - optimized and patched for pentium-m'
_kernelname="${pkgname#kernel26}"
_kversion='2.6.38'
 pkgver="${_kversion}.7" # add the subversion here, for example pkrver="${_kversion}.1"
_archver='1-ARCH'
_zenver='stable'
pkgrel='1'

arch=('i686')
license=('GPL2')
url='http://www.zen-kernel.org'

## :: user variables :: #
_zen_patch='1'          # ZEN ( _zen_patch='1' )or ARCH ( _zen_patch='0' ) patchset
_speedstep_patch='1'    # the speedstep patch
_reconfig='1'  		# needed on update only

# the kernel is ZEN by default!
# if you wish to use an ARCH one, be sure to 
# change the patchflag AND comment/uncomment according sources and md5s!

#########################

# for ARCH patch check :: http://projects.archlinux.org/linux-2.6-ARCH.git/

source=(#"ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_kversion}.tar.bz2" # Linux kernel
#"ftp://ftp.archlinux.org/other/kernel26/patch-${pkgver}-${_archver}.bz2" # ARCH patch
"http://git.zen-kernel.org/zen-stable/snapshot/zen-${_zenver}-${pkgver}.tar.bz2" # ZEN kernel
'speedstep-centrino.patch'
'config'
# standard config files for mkinitcpio ramdisk
"${pkgname}.preset"
"mkinitcpio-${pkgname}.conf")

md5sums=(#'7d471477bfa67546f902da62227fa976' # Linux Kernel
#'fb683c4eb412b6e7afac1c5ffe34c009' # ARCH patch
'd916844016d9b4c399db4b1e55c19bc8' # ZEN kernel
'17a7a0b2456f7a9512038580fc89485e' # speedstep patch
'f1624f8bb6ecfc55c6de998487cae397' # config (i686)
'7d07e5beb668f37c52fb39579ad2f2b0' # .preset and mkinitcpio
'ce00527a989ee68330c3cb8716fdd732')

# md5sum for speedstep patch v1 :: '9f385946263fe5c3c152907985a8d928'

build() {
  KARCH=x86
  cd "${srcdir}"

  if [ "${_zen_patch}" == '1' ]; then
    # ZEN kernel
    msg2 "Using ZEN kernel (zen-${_zenver}-${pkgver})"
    mv "${srcdir}/zen-${_zenver}-${pkgver}" "linux-${_kversion}"
    cd "linux-${_kversion}"
    
  else
    # ARCH patch
    cd "${srcdir}/linux-${_kversion}"

    msg2 "Applying the ARCH patch (patch-${pkgver}-${_archver})"
    patch -Np1 -i "${srcdir}/patch-${pkgver}-${_archver}" #> /dev/null
  fi
  
  # speedstep-centrino.patch
  if [ "${_speedstep_patch}" == '1' ]; then 
      msg2 'Applying the speedstep centrino patch'
      patch -N "arch/${KARCH}/kernel/cpu/cpufreq/speedstep-centrino.c" \
        -i "${srcdir}/speedstep-centrino.patch" > /dev/null
  fi
  
  # remove extraversion
  sed -i 's|^EXTRAVERSION = .*$|EXTRAVERSION =|g' Makefile
  
  msg 'Preparing the kernel config...'
  msg2 'Cleaning the kernel tree..'
  make mrproper
  
  # load configuration
  cat ../config > ./.config
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi
  
  if [ "${_reconfig}" == '1' ]; then
  	msg2 'Loading the kernel config...'
  	make prepare || return $?
  fi
  # :: (re)configure the kernel ::
  msg2 'Launching config editor...'
  make nconfig 	  	 # new CLI menu for configuration
  #make menuconfig	 # CLI menu for configuration
  #make xconfig   	 # X-based configuration
  #make oldconfig 	 # using old config from previous kernel version
  #msg 'Stopping build...'; return 1

  msg2 'Making kernel config...'
  yes "" | make config > /dev/null || return $?
  # build!
  msg 'Building the kernel...'
  msg2 'Building modules...'
  make ${MAKEFLAGS} bzImage modules || return $?
}

package_kernel26-pentium-m-firmware() {
  pkgdesc="The included firmware files of the Linux Kernel"
  groups=('base')
  msg 'Installing kernel firmware...'

  cd ${srcdir}/linux-$_kversion
  make firmware || return 1
  make INSTALL_MOD_PATH=${pkgdir} firmware_install || return $?
}

package_kernel26-pentium-m-manpages() {
  pkgdesc="Kernel hackers manual - Section 9 manpages that comes with the Linux kernel."
  makedepends=('xmlto' 'docbook-xsl')

  msg 'Installing kernel manpages...'
  cd ${srcdir}/linux-${_kversion}
  make mandocs || return 1

  install -d ${pkgdir}/usr/share/man/man9/
  install ${srcdir}/linux-${_kversion}/Documentation/DocBook/man/*.9.gz \
  	  ${pkgdir}/usr/share/man/man9/

  find ${pkgdir} -type f -exec chmod 644 {} \;
}

package_kernel26-pentium-m-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the Linux kernel."
  makedepends=('xmlto' 'docbook-xsl')
  
  msg 'Installing kernel docs...'
  cd ${srcdir}/linux-${_kversion}
  mkdir -p ${pkgdir}/usr/src/linux-${pkgver}${_kernelname}
  mv Documentation ${pkgdir}/usr/src/linux-${pkgver}${_kernelname}
  find ${pkgdir} -type f -exec chmod 444 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
  # remove a file already in kernel26 package
  rm -f ${pkgdir}/usr/src/linux-${pkgver}${_kernelname}/Documentation/DocBook/Makefile
}

package_kernel26-pentium-m-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase}"
  msg 'Building kernel headers...'
  mkdir -p ${pkgdir}/lib/modules/${_kernver}
  cd ${pkgdir}/lib/modules/${_kernver}
  ln -sf ../../../usr/src/linux-${_kernver} build
  cd ${srcdir}/linux-$_kversion
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
  
}

package_kernel26-pentium-m() {
  pkgdesc='The Linux Kernel and modules - optimized and patched for pentium-m'
  groups=('base')
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
  install="${pkgbase}.install"
  options=(!strip)
  optdepends=('crda: to set the correct wireless channels of your country')

  KARCH=x86
  cd ${srcdir}/linux-${_kversion}
  # get kernel version
  _kernver="$(make kernelrelease)"
  mkdir -p ${pkgdir}/{lib/modules,boot}

  msg2 'Installing modules...'
  make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
  cp System.map ${pkgdir}/boot/System.map26${_kernelname}
  cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}
  #  # add vmlinux
  install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset || return 1
  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i $startdir/kernel26-pentium-m.install
  sed \
    -e "s|source .*|source /etc/mkinitcpio.d/kernel26${_kernelname}.kver|g" \
    -e "s|default_image=.*|default_image=\"/boot/${pkgname}.img\"|g" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/${pkgname}-fallback.img\"|g" \
    -i ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${pkgname}.kver
  # remove build and source links
  rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware
}
