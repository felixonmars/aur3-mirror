# Maintainer: Can Celasun <dcelasun[at]gmail[com]>
# Original Arch package by:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>

pkgname=linux-mainline-dellxps
_kernelname=${pkgname#linux}
_srcname=linux-3.10-rc1
pkgver=3.10rc1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/testing/${_srcname}.tar.xz"
        #"http://www.kernel.org/pub/linux/kernel/v3.0/${_srcname}.tar.xz"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        'change-default-console-loglevel.patch'
        #'cypress-trackpad-driver-20121030.patch'
        'fuse-ntfs-fix.patch'
        'revert-pch-backlight-registers.patch'
        #'cypress1c6c152.patch'
        #'cypress25a9bac.patch'
        #'cypress271d736.patch'
        #'cypress2abd2a6.patch'
        #'cypress49ca49a.patch'
        #'cypress756f8ce.patch'
        #'cypressc70c867.patch'
        #'cypressce1b702.patch'
        #'cypressd29a837.patch'
        #'cypressdfeb9e1.patch'
        #'cypressecbe652.patch'
        #'cypressfba5b9a.patch'
        #'cypress-3.7-mt-init.patch'
        )

md5sums=('0ea7e8ba7034192e2230d31e222ca045'
         '91b88099925a7d4f9e7adb5552a9c17d'
         'baf222c5beba4d0d7e32bc0e54e66f9b'
         'eb14dcfd80c00852ef81ded6e826826a'
         '9d3c56a4b999c8bfbd4018089a62f662'
         'e095f3066e9c25ab987bf9702849d548'
         '27d74e7aa5df97dd115f45bbcbd01e02')
         #'d6637a5750227fee5536913c988149b4'
         #'56aec4c5cc30e7034e840afa3edc813c'
         #'d36ec988f9b50ec25bfb396b7e49a8f6'
         #'abbbe603660c74b06351326de98b47dc'
         #'0bc19f53839935c7622633f1f00fc0fa'
         #'b26b53f3d8a43a8a91ea6d6708a9f941'
         #'e7cc9ced15381014d4f4a87f6cbe77dc'
         #'9a8a5e8f08dc29b342821af1d8759536'
         #'66de24807cd66d620c3614944771b686'
         #'7575d657e4931545d4dc4d2950d955bc'
         #'20bebec010acd5a4b771dad5d2315929'
         #'7c91956660cc80eabff234ba6cc3d605'
         #'a3019b5e650b9bfd2ef29d906ed538d8')
_kernelname=${pkgname#linux}

# mainline: Stolen from _package

pkgdesc="The ${pkgname} kernel and modules - includes Cypress trackpad driver (for Dell XPS 13/15z)"
[ "${pkgname}" = "linux" ] && groups=('base')
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
optdepends=('crda: to set the correct wireless channels of your country')
provides=("kernel26${_kernelname}=${pkgver}")
conflicts=("kernel26${_kernelname}")
replaces=("kernel26${_kernelname}")
backup=("etc/mkinitcpio.d/${pkgname}.preset")
install=linux.install

build() {
  cd "${srcdir}/${_srcname}"

  # add FUSE NTFS patch
  patch -p1 -i "${srcdir}/fuse-ntfs-fix.patch"
  
  # add Cypress trackpad driver patches
  # Patch numbers match their corresponding Ubuntu HWE commit IDs.
  #patch -p1 -i "${srcdir}/cypress49ca49a.patch"
  #patch -p1 -i "${srcdir}/cypressc70c867.patch"
  #patch -p1 -i "${srcdir}/cypress271d736.patch"
  #patch -p1 -i "${srcdir}/cypressd29a837.patch"
  #patch -p1 -i "${srcdir}/cypressce1b702.patch"
  #patch -p1 -i "${srcdir}/cypress2abd2a6.patch"
  #patch -p1 -i "${srcdir}/cypress25a9bac.patch"
  #patch -p1 -i "${srcdir}/cypressecbe652.patch"
  #patch -p1 -i "${srcdir}/cypress1c6c152.patch"
  #patch -p1 -i "${srcdir}/cypress756f8ce.patch"
  #patch -p1 -i "${srcdir}/cypressdfeb9e1.patch"
  #patch -p1 -i "${srcdir}/cypressfba5b9a.patch"
  
  # input_mt_init_slots has changed in 3.7 and now requires a second parameter
  # If you are building kernel < 3.7 comment the below line
  #patch -p1 -i "${srcdir}/cypress-3.7-mt-init.patch"
    
  # Revert "drm/i915: don't forget the PCH backlight registers"
  # This causes backlight controls to stop working after suspend/resume.
  # Bug link: https://bugs.launchpad.net/dell-sputnik/+bug/1055231
  patch -p1 -i "${srcdir}/revert-pch-backlight-registers.patch"
  
  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  
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
  yes ""|make oldconfig # Lazy version of oldconfig
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
  # Keep a build log to track errors
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules 2>&1 | tee /tmp/dellxps.build.log
}

package() {
  _package
  _package-docs
  _package-headers
}

_package() {
  # mainline: Set Globaly
  #pkgdesc="The ${pkgbase} kernel and modules"
  #[ "${pkgbase}" = "linux" ] && groups=('base')
  #depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  #optdepends=('crda: to set the correct wireless channels of your country')
  #provides=("kernel26${_kernelname}=${pkgver}")
  #conflicts=("kernel26${_kernelname}")
  #replaces=("kernel26${_kernelname}")
  #backup=("etc/mkinitcpio.d/${pkgbase}.preset")
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
}

_package-headers() {
  # mainline: Set globaly
  #pkgdesc="Header files and scripts for building modules for ${pkgbase} kernel"
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

_package-docs() {
  # mainline: Set globaly
  #pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase} kernel"
  #provides=("kernel26${_kernelname}-docs=${pkgver}")
  #conflicts=("kernel26${_kernelname}-docs")
  #replaces=("kernel26${_kernelname}-docs")

  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}"
  # mainline: cp complains if we dont remove this
  rm -f "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"
  cp -al Documentation "${pkgdir}/usr/src/linux-${_kernver}"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"
}

# mainline: Disabled
#pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
#for _p in ${pkgname[@]}; do
#  eval "package_${_p}() {
#    _package${_p#${pkgbase}}
#  }"
#done

# vim:set ts=8 sts=2 sw=2 et:
