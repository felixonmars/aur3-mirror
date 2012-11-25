# Maintainer: Fly-away <flyaaway@gmail.com>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=linux-f2fs
_kernelname=${pkgname#linux}
_srcname=linux-3.7-rc3
pkgver=3.7rc3
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/testing/${_srcname}.tar.xz"
        #"http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        'change-default-console-loglevel.patch'
        'f2fs_v2_1.patch'
        'f2fs_v2_10.patch'
        'f2fs_v2_11.patch'
        'f2fs_v2_12.patch'
        'f2fs_v2_13.patch'
        'f2fs_v2_14.patch'
        'f2fs_v2_15.patch'
        'f2fs_v2_16.patch'
        'f2fs_v2_2.patch'
        'f2fs_v2_3.patch'
        'f2fs_v2_4.patch'
        'f2fs_v2_5.patch'
        'f2fs_v2_6.patch'
        'f2fs_v2_7.patch'
        'f2fs_v2_8.patch'
        'f2fs_v2_9.patch')
md5sums=('55b86eacf2a012ad3956cf861c72f930'
         'fea09f08c62b3121b68245a6ea147ebd'
         '516fbc2ee2548d7b90c15140b5a2ccd5'
         'eb14dcfd80c00852ef81ded6e826826a'
         '9d3c56a4b999c8bfbd4018089a62f662'
         '8a66ba811994afb0d2526c74f7c4ccb7'
         '70b61fe5d2324c73a05f79e3003f9596'
         '5ecc10047081b56e3a4f417f16c20a8e'
         '28f88bda329e481820a638a19ae38493'
         'fb6fd8aa2a40d740f941eb2cc809479a'
         'f6d0d2731818870347596b71d3e20b02'
         'f67cc21fe06debe02fef861a56663f05'
         'b18b54fc45d53b5dadde4bb850c5242c'
         '7f377ff68c7bc81eafee6fb23dfec3a4'
         '99ba6603ea21f8c17403c8ca87d46407'
         '3d0778506977d7abb0da3c8bc730d71a'
         '55d3765f308e9b4dd2a9400ceba9afaf'
         '9d5f2fa0e3269c7fe96599479d6d274d'
         'd582ba4bc5b100518c511a0eaf80324d'
         '48661400c54344935f685e5d283cb189'
         'e3d08738c3322c7472cdaec892c5b0db')

# mainline: Rescued from _package()
pkgdesc="The ${pkgname} kernel and modules"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
optdepends=('crda: to set the correct wireless channels of your country')
provides=("kernel26${_kernelname}=${pkgver}")
conflicts=("kernel26${_kernelname}")
replaces=("kernel26${_kernelname}")
backup=("etc/mkinitcpio.d/${pkgname}.preset")
install=linux.install

build() {
  cd "${srcdir}/${_srcname}"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

  # F2FS patchset
  for p in $srcdir/f2fs_v2_*.patch
  do
    echo Patch:$p
    patch -Np1 -i $p
  done

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  #make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  yes ""|make oldconfig # Lazy version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null

  # save configuration for later reuse
  if [ "${CARCH}" = "x86_64" ]; then
    cat .config > "${startdir}/config.x86_64.last"
  else
    cat .config > "${startdir}/config.last"
  fi

  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"; return 1
  ####################

  # build!
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package() {
  # mainline: These are set globaly
  #pkgdesc="The ${pkgname} kernel and modules"
  #[ "${pkgname}" = "linux" ] && groups=('base')
  #depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  #optdepends=('crda: to set the correct wireless channels of your country')
  #provides=("kernel26${_kernelname}=${pkgver}")
  #conflicts=("kernel26${_kernelname}")
  #replaces=("kernel26${_kernelname}")
  #backup=("etc/mkinitcpio.d/${pkgname}.preset")
  #install=linux.install

  cd "${srcdir}/${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgname}"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/linux.install"
  sed \
    -e "1s|'linux.*'|'${pkgname}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "$pkgdir" -F System.map "$_kernver"

  # move module tree /lib -> /usr/lib
  mv "$pkgdir/lib" "$pkgdir/usr"

  # mainline: Chain _package-header to include them in the main package
  _package-headers
}

_package-headers() {
  # mainline: This is set globaly
  #pkgdesc="Header files and scripts for building modules for ${pkgname} kernel"
  #provides=("kernel26${_kernelname}-headers=${pkgver}")
  #conflicts=("kernel26${_kernelname}-headers")
  #replaces=("kernel26${_kernelname}-headers")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${pkgdir}/usr/lib/modules/${_kernver}"
  ln -sf ../../../src/linux-${_kernver} build

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/src/linux-${_kernver}/.config"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

  for i in acpi asm-generic config crypto drm generated linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/src/linux-${_kernver}/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/src/linux-${_kernver}/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/src/linux-${_kernver}"
  cp -a scripts "${pkgdir}/usr/src/linux-${_kernver}"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/src/linux-${_kernver}/scripts"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel/"

  # mainline: Disabled
  # add headers for lirc package
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video"
  #cp drivers/media/video/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/"
  #for i in bt8xx cpia2 cx25840 cx88 em28xx pwc saa7134 sn9c102; do
  #  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
  #  cp -a drivers/media/video/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
  #done

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/src/linux-${_kernver}/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"

  # mainline: Disabled
  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core"
  #cp drivers/media/dvb/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
  #cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

  # mainline: Disabled
  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  #cp drivers/media/dvb/frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  #cp drivers/media/video/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"

  # mainline: Disabled
  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb"
  #cp drivers/media/dvb/dvb-usb/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/"
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends"
  #cp drivers/media/dvb/frontends/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
  #mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners"
  #cp drivers/media/common/tuners/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/mm"
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do
    mkdir -p "${pkgdir}"/usr/src/linux-${_kernver}/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/src/linux-${_kernver}/${i}"
  done

  chown -R root.root "${pkgdir}/usr/src/linux-${_kernver}"
  find "${pkgdir}/usr/src/linux-${_kernver}" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/src/linux-${_kernver}/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# mainline: -docs disabled
#_package-docs() {
#  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase} kernel"
#  provides=("kernel26${_kernelname}-docs=${pkgver}")
#  conflicts=("kernel26${_kernelname}-docs")
#  replaces=("kernel26${_kernelname}-docs")
#
#  cd "${srcdir}/${_srcname}"
#
#  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}"
#  cp -al Documentation "${pkgdir}/usr/src/linux-${_kernver}"
#  find "${pkgdir}" -type f -exec chmod 444 {} \;
#  find "${pkgdir}" -type d -exec chmod 755 {} \;
#
#  # remove a file already in linux package
#  rm -f "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"
#}

#pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
#for _p in ${pkgname[@]}; do
#  eval "package_${_p}() {
#    _package${_p#${pkgbase}}
#  }"
#done

# vim:set ts=8 sts=2 sw=2 et:
