# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: <fsckdaemon at gmail dot com>
# Contributor: graysky <graysky AT archlinux dot us>

### Patch and Build Options ###
_USE_MAKENCONFIG="n"    # nconfig option
_USE_BFQ_IOSCHED="n"    # add BFQ patches for the BFQ I/O scheduler
_USE_LOCALMODCFG="n"    # make localmod config - compile ONLY probed modules - see notes below!
_USE_CURRENT_CFG="n"    # use the current kernel's .config file - see notes below!

### More Details and References ###
## MAKENCONFIG OPTION
 # Allow you to select additional kernel options prior to a build via a nconfig.

## BFQ
 # Read, http://algo.ing.unimo.it/people/paolo/disk_sched/

## LOCALMODCONFIG OPTION
 # As of mainline 2.6.32, running with this option will only build the modules that you currently have
 # probed in your system VASTLY reducing the number of modules build.
 #
 # WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
 # Read, https://bbs.archlinux.org/viewtopic.php?pid=830221#p830221
 # To keep track of which modules are needed for your specific system/hardware, give graysky's module_db script.
 # a try: http://aur.archlinux.org/packages.php?ID=41689
 #
 # Note that if you use module_db script, this PKGBUILD will auto run the reload_data base for you to probe
 # all the modules you have logged!

## CURRENT KERNEL'S .CONFIG
 # Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
 # Useful when the package gets updated and you already went through the trouble of customizing your
 # config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

pkgname=kernel26-bfs
true && pkgbase=kernel26-bfs
true && pkgname=('kernel26-bfs' 'kernel26-bfs-headers')
_kernelname=${pkgname#kernel26}
_basekernel=2.6.39
_bfsrel=406
pkgver=${_basekernel}.3
pkgrel=${_bfsrel}.1
arch=('i686' 'x86_64')
url="http://ck-hack.blogspot.com"
license=('GPL2')
pkgdesc="Linux kernel and modules with BFS scheduler, with BFQ I/O scheduler as optional."
makedepends=('coreutils' 'linux-firmware' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8-2')
options=(!strip)
_archpatch="patch-${pkgver}-1-ARCH"
_gcc460patch="${_basekernel}-disable-wunused-but-set-var-gcc-4-6-0.patch"
_bfspatch="${_basekernel}-sched-bfs-${_bfsrel}.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/${_basekernel}"
_bfqpatch1="0001-block-prepare-I-O-context-code-for-BFQ-v2-for-${_basekernel}.patch"
_bfqpatch2="0002-block-cgroups-kconfig-build-bits-for-BFQ-v2-${_basekernel}.patch"
_bfqpatch3="0003-block-introduce-the-BFQ-v2-I-O-sched-for-${_basekernel}.patch"
source=("ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2"
        "ftp://ftp.archlinux.org/other/kernel26/${_archpatch}.bz2"
        'config' 'config.x86_64' 'kernel26.preset'
        "${_gcc460patch}"
        "http://ck.kolivas.org/patches/bfs/${_basekernel}/${_bfspatch}"
        "${_bfqpath}/${_bfqpatch1}"
        "${_bfqpath}/${_bfqpatch2}"
        "${_bfqpath}/${_bfqpatch3}")
sha256sums=('584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6'  # Linux kernel
            '752445f22d2746bedd79846c1e78ece31b434eae613c2c256e17ad77cf1a9029'  # Arch kernel patches
            '4ecc29d6a509692c7d7e5e0c0eb96ffbdb1a2fee8c4c5be18befc187b301a737'  # config
            '69c971f9e219344d36b13e1d6ee1928b30c9a9b210c44d1196fa1162c61db680'  # config.x86_64
            'e25580bb1f9e904e23ebb648b8327b2adbb1579143ad8c8edbb6c912703f3488'  # kernel26.preset
            'ba74e08c4a6104d605d332dfb3e49a016d385be2421f1b53e20cd2148c15219b'  # gcc patch
            '19f05242cc4969c2d1348c88e5cc6948ff7fd5d778f4ca90d34b8b123a7f7a3f'  # BFS patch
            '7051be08f3318503c30d18f6b18937648074cfccc8c1e052cd296afab47d50fe'  # BFQ patch 1
            '0b2bae2acabae85f05913b6c2a1d49e5b19f913df38564bd5eed1ebf884406e0'  # BFQ patch 2
            '93d0c86c11e17dc0c3d89ba509537f7f0516bde52189b8c5ef27584871e4b368') # BFQ patch 3

build() {
  cd "${srcdir}/linux-${_basekernel}"

  # Patch source with -ARCH patches
  # See http://projects.archlinux.org/linux-2.6-ARCH.git/
  msg "Patching source with -ARCH patches"
  patch -Np1 -i "${srcdir}/${_archpatch}"

  msg "Patching source with gcc460patch"
  patch -Np1 -i "${srcdir}/${_gcc460patch}"

  # Patch source with BFS patches
  msg "Patching source with BFS patches"
  patch -Np1 -i "${srcdir}/${_bfspatch}"

  # Optionally patch source with BFQ patches
  if [ "${_USE_BFQ_IOSCHED}" = "y" ]; then
    msg "Patching source with BFQ patches"
    patch -Np1 -i "${srcdir}/${_bfqpatch1}"
    patch -Np1 -i "${srcdir}/${_bfqpatch2}"
    patch -Np1 -i "${srcdir}/${_bfqpatch3}"
  fi

  msg "Running make mrproper to clean source tree"
  make mrproper

  if [ "$CARCH" = "x86_64" ]; then
    cat ../config.x86_64 >./.config
  else
    cat ../config >./.config
  fi
  # Use current kernel's config
  # Code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
  if [ "${_USE_CURRENT_CFG}" = "y" ]; then
    if [[ -s /proc/config.gz ]]; then
      msg "Extracting config from /proc/config.gz..."
      modprobe configs
      zcat /proc/config.gz > ./.config
    else
      warning "You kernel was not compiled with IKCONFIG_PROC!"
      warning "You cannot read the current config!"
      warning "Aborting!"
      return 1
    fi
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  msg "Running make prepare for you to enable patched options of your choosing"
  make prepare

  # If user patched to BFQ and enabled it in the prev step, set it as default io scheduler
  if [ "${_USE_BFQ_IOSCHED}" = "y" ]; then
    sed -i s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set/g' ./.config
    sed -i s'/# CONFIG_DEFAULT_BFQ is not set/CONFIG_DEFAULT_BFQ=y/g' ./.config
    sed -i s'/CONFIG_DEFAULT_IOSCHED="cfq"/CONFIG_DEFAULT_IOSCHED="bfq"/g' ./.config
  fi

  if [ "${_USE_LOCALMODCFG}" = "y" ]; then
    msg "If you have modprobe_db installed, running reload_database now"
    # Optionally load needed modules for the make localmodconfig
    # See http://aur.archlinux.org/packages.php?ID=41689
    if [ -e /usr/bin/reload_database ]; then
      /usr/bin/reload_database
    fi
    msg "Running Steven Rostedt's make localmodconfig now"
    make localmodconfig
  fi

  if [ "${_USE_MAKENCONFIG}" = "y" ]; then
    msg "Running make nconfig"
    make nconfig
    #msg "Stopping build"
    #return 1
  fi

  yes "" | make config

  msg "Running make bzImage and modules"
  make ${MAKEFLAGS} bzImage modules
}

package_kernel26-bfs() {
  backup=("etc/mkinitcpio.d/${pkgname}.preset")
  depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8-2')
  # pwc, ieee80211 and hostap-driver26 modules are included in kernel26 now
  # nforce package support was abandoned by nvidia, kernel modules should cover everything now.
  # kernel24 support is dropped since glibc24
  replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
            'alsa-driver' 'ieee80211' 'hostap-driver26'
            'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
            'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
            'gspcav1' 'atl2' 'wlan-ng26' 'rt2500' 'nouveau-drm')
  install=kernel26.install
  optdepends=('crda: to set the correct wireless channels of your country'
              'nvidia-bfs: nvidia drivers for kernel26-bfs'
              'nvidia-bfs-beta: nvidia BETA drivers for kernel26-bfs'
              'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those who use make localmodconfig')

  KARCH=x86
  cd ${srcdir}/linux-${_basekernel}
  # get kernel version
  _kernver="$(make kernelrelease)"
  mkdir -p ${pkgdir}/{lib/modules,lib/firmware,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install
  cp System.map ${pkgdir}/boot/System.map26${_kernelname}
  cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}
  # add vmlinux
  install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -m644 -D ${srcdir}/kernel26.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset
  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i ${startdir}/kernel26.install
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
  # gzip -9 all modules to safe 100MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

package_kernel26-bfs-headers() {
  true && pkgdesc="Header files and scripts for building modules for kernel26-bfs"
  true && depends=("kernel26-bfs=${pkgver}")

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
  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/11194
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  [[ -e include/config/dvb/ ]] && cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
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
  find ${pkgdir}/usr/src/linux-${_kernver}/scripts -type f -perm -u+w 2>/dev/null | while read binary ; do
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

# vim: ts=2 sts=2 sw=2 et:
