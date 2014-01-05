pkgbase=linux-ac100-l4t-git
#pkgbase=linuxac100-l4t-git-custom # Build kernel with a different name

_kernelname=${pkgbase#linux}


makedepends=('xmlto' 'docbook-xsl' 'lzop' 'git')
options=('!strip')
pkgver=16.2.20131231
pkgrel=2
arch=('arm' 'armv7h')
url="http://www.kernel.org/"
license=('GPL2')
source=("linux.preset"
        "mkinitcpio.conf"
        "bootimg.cfg"
        "armdma.patch"
        "config"
        "change-default-console-loglevel.patch"
        "unselect-pci.patch")

md5sums=('eb2055a644481dbf42fcddb330a9dd19'
         'c14ea47a27d715a06fa72312978d667d'
         '93200424c38d91eeb628c0a8da65ef1c'
         '6e7667c6c6348bfeca22eaaa05462d62'
         '63ef93f93a6220aee530e1029b05fa34'
         '9d3c56a4b999c8bfbd4018089a62f662'
         'a230e8c843d8e4ed53c246151b0c356b')


_gitroot=git://gitorious.org/~marvin24/ac100/marvin24s-kernel.git
_gitname=linux-marvin24s-ac100-l4t
_gitbranch=l4t-r16-r2-ac100

prepare() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    # With --single-branch we download at least 500MB and not 800MB
    git clone "${_gitroot}" "${_gitname}" -b ${_gitbranch} --single-branch
  fi

  msg "GIT checkout done or server timeout"
  cd "${srcdir}"
  rm -rf "${_gitname}-build"
  git clone "${_gitname}" "${_gitname}-build" -b $_gitbranch --local

  cd "${_gitname}-build"

  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  patch -Np1 -i "${srcdir}/armdma.patch"
  # Tegra machines doesn't need pci (and the paz00 machine has no pci).
  # This patch allows us to deselect (or select) pci on tegra machines.
  patch -Np1 -i "${srcdir}/unselect-pci.patch"

  # If you want to reconfigure be sure to enable CONFIG_SND_PCM=y
  # which is needed by CONFIG_USB_G_ANDROID=y (but is not set; there is a bug)

  # oldconfig from core(x86)/linux
  # Changes (because they failed to build):
  #  CONFIG_APPAMOR is not set
  #  some DRM and DMA configurations are deselected
  #  Disabled TEGRA_NVAVP
  #  MLX4_EN LPDDR
  #  USB_SPEEDTOUCH
  #  USB_ETH
  #  MTD_NAND_TEGRA
  # This configuration enables still devices that will never be found on the
  # paz00/ac100 board. Pci is not supported.
  cat "${srcdir}/config" > ./.config
  #cat "arch/arm/configs/paz00_defconfig" > ./.config
  # make paz00_defconfig

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # drop the + from the version string
  sed -i 's|"${LOCALVERSION+set}" != "set"|"set" != "set"|g' scripts/setlocalversion
}

build() {
  cd "${srcdir}/${_gitname}-build"

  make prepare
  #make nconfig # menuconfig / nconfig / xconfig / oldconfig
  #cp ./.config ../config

  make ${MAKEFLAGS} LOCALVERSION= zImage modules
}

_package() {
  pkgdesc="The nvidia l4t kernel and modules with marvin24's patches to support the ac100 (tegra/paz00)"
  depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.16' 'mkinitcpio>=0.7' 'abootimg-git')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=3.1.10" "linux-ac100")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset" "boot/bootimg-${pkgbase}.cfg"
          "etc/mkinitcpio-${pkgbase}.conf")
  install=linux.install

  cd "${srcdir}/${_gitname}-build"

  KARCH=arm

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/arm/boot/zImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  install -D -m644 "${srcdir}/mkinitcpio.conf" "${pkgdir}/etc/mkinitcpio-${pkgbase}.conf"

  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_config=.*|ALL_config=\"/etc/mkinitcpio-${pkgbase}.conf\"|" \
    -e "s|ALL_kver=.*|ALL_kver=\"${_kernver}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

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

  # install the abootimg configuration file
  install -D -m644 "${srcdir}/bootimg.cfg" "${pkgdir}/boot/bootimg-${pkgbase}.cfg"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${pkgdir}/usr/lib/modules/${_kernver}"
  ln -sf ../../../src/linux-${_kernver} build

  cd "${srcdir}/${_gitname}-build"

  install -D -m644 Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/src/linux-${_kernver}/.config"

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
  #FIXME

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
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd "${srcdir}/${_gitname}-build"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}"
  cp -al Documentation "${pkgdir}/usr/src/linux-${_kernver}"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done

# this would never be executed
workaround_for_the_aur_webinterface='
pkgname="linux-ac100-l4t-git"
pkgdesc="The nvidia l4t kernel and modules with marvin24`s patches to support the ac100 (tegra/paz00)"
depends=("coreutils" "linux-firmware" "module-init-tools>=3.16" "mkinitcpio>=0.7" "abootimg-git")
optdepends=("crda: to set the correct wireless channels of your country")
provides=("linux=3.1.10" "linux-ac100")
backup=("etc/mkinitcpio.d/linux-${pkgname}.preset" "boot/bootimg-${pkgname}.cfg")
install=linux.install
'

# vim:set ts=8 sts=2 sw=2 et:
