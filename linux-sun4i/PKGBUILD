# Maintainer: smotocel69  <smotocel69@gmail.com>


buildarch=4

_mach=sun4i
_github_user=linux-sunxi
_github_repo=linux-sunxi
_github_commitID=a7350cb6a9ec1aae510e26cdc730f05f12e13f9f
pkgbase=linux-${_mach}
pkgname=("linux-sun4i")
# pkgname=linux-custom       # Build kernel with a different name
_kernelname=${pkgname#linux}
_basekernel=3.4
pkgver=${_basekernel}.67
pkgrel=3
arch=('armv7h')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'uboot-mkimage')
options=('!strip')
source=('change-default-console-loglevel.patch'
        "linux.tar.gz::https://github.com/${_github_user}/${_github_repo}/tarball/${_github_commitID}")
md5sums=('9d3c56a4b999c8bfbd4018089a62f662'
         'c0d84a8abcbe9a5546e1d1068ea8bd0f')

build() {
  cd ${srcdir}
  # the github-commit-tarball issue results in this, rename it sanely
  mv "${_github_user}-${_github_repo}-${_github_commitID:0:7}" linux

  cd linux
  #cp ../config .config

  # add upstream patch
  #patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

  make sun4i_defconfig

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # Copy back our configuration (use with new kernel version)
  #cp ./.config ../${pkgver}.config

  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################

  #yes "" | make config

  # build!
  make ${MAKEFLAGS} modules uImage
}

package_linux-sun4i() {
  pkgdesc="The Linux Kernel and modules for AllWinner A10(without headers)"
  depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.16')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26-${_mach}" "linux=${_mach}")
  conflicts=('kernel26' 'linux')
  replaces=('kernel26')
  backup=("etc/mkinitcpio.d/${pkgname}.preset")
  install=${pkgname}.install

  cd "${srcdir}/linux"

  KARCH=arm

  # get kernel version
  _kernver="$(make kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  #cd arch/$KARCH/boot/

  cd "${srcdir}/linux"
  #cp arch/$KARCH/boot/kernel.img ${pkgdir}/boot/kernel.img
  cp arch/$KARCH/boot/uImage "${pkgdir}/boot/uImage"

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i  "${startdir}/${pkgname}.install"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save ~100MB of space
  find "${pkgdir}" -name '*.ko' |xargs -P 2 -n 1 gzip -9
  # make room for external modules
  ln -s "../extramodules-${pkgver}-${_kernelname:-ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${pkgver}-${_kernelname:-ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${pkgver}-${_kernelname:-ARCH}/version"

  # Now we call depmod...
  depmod -b "$pkgdir" -F System.map "$_kernver"

  # move module tree /lib -> /usr/lib
  #mkdir -p "${pkgdir}/usr"
  #mv "$pkgdir/lib" "$pkgdir/usr"

}
