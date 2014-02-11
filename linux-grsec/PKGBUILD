# Original kernel maintainers:
#   Tobias Powalowski <tpowa@archlinux.org>
#   Thomas Baechler <thomas@archlinux.org>
#
# Contributors:
#   henning mueller <henning@orgizm.net>
#   Thomas Dwyer http://tomd.tel
#
# Find this package in the AUR:
#   https://aur.archlinux.org/packages/linux-grsec
#
# Please report bugs and feature requests on GitHub:
#   https://github.com/nning/linux-grsec
#

pkgname=linux-grsec
true && pkgname=(linux-grsec linux-grsec-headers)
_kernelname=${pkgname#linux}
_basekernel=3.13
_grsecver=3.0
_timestamp=201402091134
pkgver=${_basekernel}.2
pkgrel=3
arch=(i686 x86_64)
url='https://github.com/nning/linux-grsec'
license=(GPL2)
options=(!strip)
makedepends=(bc)

[ "$1" = '-v' ] && echo $pkgver $_timestamp

# The MENUCONFIG environment variable controls the invokation of the kernel
# configuration (see line 71). 0 does not run menuconfig (default), 1 runs
# menuconfig and exits, 2 runs menuconfig and builds the kernel.
_menuconfig=0
[ ! -z $MENUCONFIG ] && _menuconfig=$MENUCONFIG

_grsec_patch="grsecurity-$_grsecver-$pkgver-$_timestamp.patch"

source=(
  http://www.kernel.org/pub/linux/kernel/v3.x/linux-$_basekernel.tar.xz
  http://www.kernel.org/pub/linux/kernel/v3.x/patch-$pkgver.xz
  http://grsecurity.net/test/$_grsec_patch
  known-exploit-detection.patch
  config.i686
  config.x86_64
  $pkgname.install
  $pkgname.preset
  sysctl.conf
  module-blacklist.conf
)

build() {
  cd "$srcdir/linux-$_basekernel"

  # add upstream patch
  [ -f "$srcdir/patch-$pkgver" ] &&
    patch -p1 -i "$srcdir/patch-$pkgver"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  sed -i 's/DEFAULT_CONSOLE_LOGLEVEL 7/DEFAULT_CONSOLE_LOGLEVEL 4/' kernel/printk/printk.c

  # Add known exploit detection patch
  # http://lkml.org/lkml/2013/12/12/358
  patch -Np1 -i "$srcdir/known-exploit-detection.patch"

  # Add grsecurity patches
  patch -Np1 -i "$srcdir/$_grsec_patch"
  rm localversion-grsec

  cat "${srcdir}/config.${CARCH}" > ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  [ "$_menuconfig" = "0" ] && {
    make prepare
  }

  # Configure the kernel. Replace the line below with one of your choice.
  [ "$_menuconfig" -gt "0" ] && {
    make menuconfig # CLI menu for configuration
    #make nconfig # new CLI menu for configuration
    #make xconfig # X-based configuration
    #make oldconfig # using old config from previous kernel version
    # ... or manually edit .config
  }

  ####################
  # stop here
  # this is useful to configure the kernel
  [ "$_menuconfig" = "1" ] && {
    msg "Stopping build"
    return 1
  }
  ####################

  yes "" | make config

  # build!
  make ${MAKEFLAGS} bzImage modules
}

package_linux-grsec() {
  pkgdesc="The Linux Kernel and modules with grsecurity/PaX patches"
  groups=('base')
  depends=('gradm' 'linux-pax-flags' 'coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26-grsec')
  conflicts=('kernel26-grsec')
  replaces=('kernel26-grsec')
  backup=(
    etc/mkinitcpio.d/$pkgname.preset
    etc/modprobe.d/dma.conf
    etc/sysctl.d/05-grsecurity.conf
  )
  install=${pkgname}.install

  cd "$srcdir/linux-$_basekernel"

  KARCH=x86

  # get kernel version
  _kernver="$(make kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgname}"

  # add vmlinux and gcc plugins
  install -Dm644 vmlinux "$pkgdir/usr/src/linux-$_kernver/vmlinux"
  mkdir -p "$pkgdir/usr/src/linux-$_kernver/tools/gcc"
  install -m644 tools/gcc/*.so "$pkgdir/usr/src/linux-$_kernver/tools/gcc/"

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -D -m644 "${srcdir}/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${pkgname}.install"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgname}\"|g" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|g" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|g" \
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

  # Copy sysctl configuration
  install -Dm600 "$srcdir/sysctl.conf" "$pkgdir/etc/sysctl.d/05-grsecurity.conf"

  # Copy kernel module blacklist
  install -Dm600 "$srcdir/module-blacklist.conf" "$pkgdir/etc/modprobe.d/dma.conf"

  # Copy current grsec patch
  install -Dm644 "$srcdir/$_grsec_patch" \
    "$pkgdir/usr/share/doc/$pkgname/$_grsec_patch"
}

package_linux-grsec-headers() {
  true && pkgdesc="Header files and scripts for building modules for linux kernel with grsecurity/PaX patches"
  provides=('kernel26-grsec-headers')
  conflicts=('kernel26-grsec-headers')
  replaces=('kernel26-grsec-headers')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${pkgdir}/usr/lib/modules/${_kernver}"
  ln -sf ../../../src/linux-${_kernver} build

  cd "$srcdir/linux-$_basekernel"
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

  # add headers for lirc package
  # pci
  for i in bt8xx cx88 saa7134; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
    cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
  done
  # usb
  for i in cpia2 em28xx pwc sn9c102; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
    cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
  done
  # i2c
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c"
  cp drivers/media/i2c/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
  for i in cx25840; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
    cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
  done

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

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/tuners/"

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

sha256sums=('4d5e5eee5f276424c32e9591f1b6c971baedc7b49f28ce03d1f48b1e5d6226a2'
            '577a7b2dd6be03958c60c782458b258eb9bd202330d12f4c491b5b49ae2a457a'
            '3eb0c3c64f3576a6d1179e02feef37e716f78f0deb22611160191cee07ab6b3d'
            'af6927f770f3c4c190111b05c1b97265ef8f245defeb25b59d5a731132524fbd'
            'ba7a5df1990fc82051512319019c182e1af0ba0813d0ba682c8140c1be23c21f'
            'fb124f8141605d5bdafca521900fe2f26d4472c561de6dc621a63afde366884f'
            '305542cb76d1487dc97015316a8a867900b3640c16ab9c8798f39233259b329d'
            'ca7e718375b3790888756cc0a64a7500cd57dddb9bf7e10a0df22c860d91f74d'
            'f1a770e2a769f07f2fbb63d18bd0f2bb319d080149643b97503ec39c5df1b90d'
            '50e9e4ce335bae3787aa6b28c535d32035d39803387d17b67a05dc0589606c8f')
