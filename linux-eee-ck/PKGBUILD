# Maintainer: gruppenpest <drgruppenpest@softhome.net>
# Previous maintainer: OK <ok100.ok100.ok100@gmail.com>
# Based on kernel-eee PKGBUILD by Dan McGee <dan@archlinux.org>

pkgname=(linux-eee-ck linux-eee-ck-headers)
_ckpatchversion=1
_majorver=4.0
_ckpatchname="patch-${_majorver}-ck${_ckpatchversion}"
_srcname=linux-${_majorver}
pkgver=4.0.5
pkgrel=1
arch=('i686')
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
url="http://www.kernel.org"
source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "http://ck.kolivas.org/patches/4.0/4.0/4.0-ck${_ckpatchversion}/${_ckpatchname}.bz2"
        "http://ck.kolivas.org/patches/bfs/4.0/4.0/pending/bfs462-rtmn-fix.patch"
        "http://ck.kolivas.org/patches/bfs/4.0/4.0/pending/bfs462-update_inittask.patch"
        'bfs462-nosubmit.patch'
        'change-default-console-loglevel.patch'
        '61-eee-ssd.rules'
        'kernelconfig')



prepare() {
  # get into the linux source directory and start some magic
  cd "${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i ${srcdir}/change-default-console-loglevel.patch

  #patch source with ck patchset with BFS
  # Fix double name in EXTRAVERSION
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/${_ckpatchname}"
  msg "Patching source with ck1 including BFS v0.462"
  patch -Np1 -i "${srcdir}/${_ckpatchname}"

  ### Clean tree and copy ARCH config over
  msg "Running make mrproper to clean source tree"
  make mrproper
  cp ../kernelconfig ./.config

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  msg "Running make prepare for you to enable patched options of your choosing"
  make prepare
}

build() {
  cd "${_srcname}"


  # to modify kernel settings, uncomment the following line
  # make menuconfig

  # build!
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-eee-ck() {
  pkgdesc='Linux Kernel and modules for the Asus Eee PC 701, with Brain Fuck Scheduler v0.462'
  #pkgdesc="${_Kpkgdesc}"

  provides=("linux-eee-ck=${pkgver}")
  depends=('coreutils' 'module-init-tools')
  optdepends=('crda: for wireless regulatory domain support'
            'iw: for wireless configuration support')
  replaces=('linux-uvc-eee-svn' 'madwifi-eee-svn')
  install='linux-eee-ck.install'

  cd "${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{/lib/firmware,lib/modules,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-eee-ck"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  sed \
	-e  "s/KERNEL_NAME=.*/KERNEL_NAME=-eee-ck/g" \
	-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
	-i "${startdir}/${install}"

  # udev rules for SSD drives/SD Cards, they is not rotational
  mkdir -p ${pkgdir}/lib/udev/rules.d/
  install -m644 ${srcdir}/61-eee-ssd.rules ${pkgdir}/lib/udev/rules.d/

  # remove build and source links
  rm "${pkgdir}"/lib/modules/${_kernver}/{build,source}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-eee-ck-headers() {
  pkgdesc='Header files and scripts to build modules for linux-eee-ck.'
  depends=('linux-eee-ck') # added to keep kernel and headers packages matched
  replaces=('kernel26-ck-headers')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH/kernel"

  cp arch/$KARCH/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH/"

  cp arch/$KARCH/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH/"
  cp arch/$KARCH/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
  "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194

  ### DO NOT MERGE OUT THIS IF STATEMENT
  ### IT AFFECTS USERS WHO STRIP OUT THE DVB STUFF SO THE OFFICIAL ARCH CODE HAS A CP
  ### LINE THAT CAUSES MAKEPKG TO END IN AN ERROR
  ###
  if [ -d include/config/dvb/ ]; then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
      cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  fi

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  # removed in 3.17 series
  #cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do 
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"  -type f -perm -u+w 2>/dev/null | while read binary ; do
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
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,um,unicore32,v850,xtensa}
}
md5sums=('a86916bd12798220da9eb4a1eec3616d'
         'd634b677385910495fd0c831c0cc5520'
         '4a799bb6e601f49ad3adff004ac55ef8'
         'f5d607655b1a595332d7861f9932b6ad'
         'b603f871299fd68ec5a48a2552153dc3'
         '3ee34380eadb815848e4ad8859955540'
         'df7fceae6ee5d7e7be7b60ecd7f6bb35'
         '6100b3e13c4c24ce3c887a1ae36ab7f1'
         'c714b792616a59fc42c0da3ef88d5f4e')
