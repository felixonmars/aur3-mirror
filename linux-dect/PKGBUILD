# $Id: PKGBUILD 130991 2011-07-09 12:23:51Z thomas $
# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgbase=linux-dect
#pkgname=('linux' 'linux-headers' 'linux-docs') # Build stock -ARCH kernel
pkgname=('linux-dect')       # Build kernel with a different name
_kernelname=${pkgname#linux}
_basekernel=3.2
_gitbasekernelname=2.6
pkgver=${_basekernel}.8
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'git')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "${pkgname}.preset"
        'change-default-console-loglevel.patch'
        'i915-fix-ghost-tv-output.patch'
        'i915-gpu-finish.patch'
        'ext4-options.patch')
md5sums=('417b97cdd9e8b2664eb31260dbbcdc72'
         '76d848d39c40b13a39407810f4ede9a2'
         'a2eb6d4d242b3b1a3c7e63010f0bc985'
         'eb14dcfd80c00852ef81ded6e826826a'
         '9d3c56a4b999c8bfbd4018089a62f662'
         '263725f20c0b9eb9c353040792d644e5'
         '4cd79aa147825837dc8bc9f6b736c0a0'
         'c8299cf750a84e12d60b372c8ca7e1e8')

build() {

  cd "${srcdir}/"
  git clone git://dect.osmocom.org/git/linux-2.6
  cd "linux-${_gitbasekernelname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # fix FS#27883
  # drm/i915: Only clear the GPU domains upon a successful finish
  patch -Np1 -i "${srcdir}/i915-gpu-finish.patch"

  # Some chips detect a ghost TV output
  # mailing list discussion: http://lists.freedesktop.org/archives/intel-gfx/2011-April/010371.html
  # Arch Linux bug report: FS#19234
  #
  # It is unclear why this patch wasn't merged upstream, it was accepted,
  # then dropped because the reasoning was unclear. However, it is clearly
  # needed.
  patch -Np1 -i "${srcdir}/i915-fix-ghost-tv-output.patch"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

  # fix ext4 module to mount ext3/2 correct
  # https://bugs.archlinux.org/task/28653
  patch -Np1 -i "${srcdir}/ext4-options.patch"

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  # make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  ####################
  # stop here
  # this is useful to configure the kernel
  # msg "Stopping build"
  # return 1
  ####################

  yes "" | make config

  # build!
  make ${MAKEFLAGS} bzImage modules
  make headers_install
}

package() {
  pkgdesc="The Linux Kernel and modules (with dect support)"
  groups=('base')
  depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.16' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  #provides=('kernel26')
  #conflicts=('kernel26')
  #replaces=('kernel26')
  backup=("etc/mkinitcpio.d/${pkgname}.preset")
  install=${pkgname}.install

  cd "${srcdir}/linux-${_gitbasekernelname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgname}"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

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
  ln -s "../extramodules-${_gitbasekernelname}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"
}
