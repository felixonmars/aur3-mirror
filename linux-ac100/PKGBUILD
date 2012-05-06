pkgname=linux-ac100

_kernelname=${pkgname#linux}

pkgver=20120506
pkgrel=1
arch=(arm armv7h)
url="http://www.kernel.org/"
license=(GPL2)
makedepends=(xmlto docbook-xsl lzop git)
options=(!strip)
pkgdesc="linux kernel - toshiba ac100 (tegra/paz00)"
depends=(coreutils linux-firmware 'module-init-tools>=3.16' 'mkinitcpio>=0.7' abootimg-git)
optdepends=('crda: to set the correct wireless channels of your country')
provides=(linux linux-headers)
backup=("etc/mkinitcpio.d/${pkgname}.preset")
install=${pkgname}.install
source=(linux-ac100.install
        linux-ac100.preset
        bootimg.cfg
        armdma.patch
        config
        change-default-console-loglevel.patch)

_gitroot=git://gitorious.org/~marvin24/ac100/marvin24s-kernel.git
_gitname=chromeos-ac100-3.0

build() {
  cd $srcdir
  if [[ -d "$srcdir/marvin24s-kernel" ]]; then
    cd "$srcdir/marvin24s-kernel"
    git reset --hard && git clean -dxf
    #git pull
  else
    git clone "$_gitroot" -b "$_gitname"
    cd "$srcdir/marvin24s-kernel"
  fi

  unset LDFLAGS

  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  patch -Np1 -i "${srcdir}/armdma.patch"
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  cat "${srcdir}/config" > ./.config
  #cat "${srcdir}/marvin24s-kernel/arch/arm/configs/paz00_defconfig" > ./.config

  make prepare
  #make nconfig # menuconfig / nconfig / xconfig / oldconfig
  #cp ./.config ../config

  make zImage modules
}

package() {
  mkdir -p "${pkgdir}/lib/modules/${_kernver}"

  cd "${pkgdir}/lib/modules/${_kernver}"
  ln -sf ../../../usr/src/linux-${_kernver} build

  cd "$srcdir/marvin24s-kernel"
  _kernver="$(make ${MAKEFLAGS} kernelrelease)"

  install -D -m644 Makefile "${pkgdir}/usr/src/linux-${_kernver}/Makefile"
  install -D -m644 kernel/Makefile "${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
  install -D -m644 .config "${pkgdir}/usr/src/linux-${_kernver}/.config"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

  for i in acpi asm-generic config crypto drm generated linux math-emu \
    media net pcmcia scsi sound trace video xen; do
    cp -a include/${i} "${pkgdir}/usr/src/linux-${_kernver}/include/"
  done

  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/arm
  cp -a arch/arm/include ${pkgdir}/usr/src/linux-${_kernver}/arch/arm/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/arm/mach-tegra
  cp -a arch/arm/mach-tegra/include ${pkgdir}/usr/src/linux-${_kernver}/arch/arm/mach-tegra/

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/src/linux-${_kernver}"
  cp -a scripts "${pkgdir}/usr/src/linux-${_kernver}"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/src/linux-${_kernver}/scripts"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/arm/kernel"

  cp arch/arm/Makefile "${pkgdir}/usr/src/linux-${_kernver}/arch/arm/"

  cp arch/arm/kernel/asm-offsets.s "${pkgdir}/usr/src/linux-${_kernver}/arch/arm/kernel/"

  # add headers for lirc package
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video"

  cp drivers/media/video/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/"

  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
    cp -a drivers/media/video/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
  done

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/src/linux-${_kernver}/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"

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
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,x86,xtensa}


  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot/ac100}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/arm/boot/zImage $pkgdir/boot/ac100/
  cp $srcdir/bootimg.cfg $pkgdir/boot/ac100/

  sed -e "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
      -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
      -i "${startdir}/${pkgname}.install"

  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  #rm -rf "${pkgdir}/lib/firmware"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  install -D -m644 "$srcdir/$pkgname.preset" "$pkgdir/etc/mkinitcpio.d/$pkgname.preset"
  sed -i "s/^ALL_kver=.*$/ALL_kver=$_kernver/" "$pkgdir/etc/mkinitcpio.d/$pkgname.preset"
}

md5sums=('1d82a75b32ba31c607e7d8c5adae03a5'
         '8ab9596a6c1f08548a1580a3511437dc'
         '097ac7a09a4188cb4dc5410a07090c1f'
         '6e7667c6c6348bfeca22eaaa05462d62'
         '2209e26210f83dd4212454baf4749622'
         '9d3c56a4b999c8bfbd4018089a62f662')
