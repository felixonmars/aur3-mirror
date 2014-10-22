# Maintainer: Ettore Chimenti <ek5.chimenti at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
pkgname=uboot-zc70x-git
pkgver=2014.3
pkgrel=2
pkgdesc='Utilities for working with Das U-Boot Compiled for zc70x'
arch=('i686' 'x86_64')
url="http://www.denx.de/wiki/U-Boot/WebHome"
license=('GPL2')
makedepends=('arm-linux-gnueabihf-gcc')
provides=('uboot-zc70x')
conflicts=('uboot-zc70x')
source=("git://github.com/Xilinx/u-boot-xlnx"
  0001-python-use-python2.patch)
md5sums=('SKIP'
         'eed123ded47d92fe87a80f595a1608d2')
options=('!strip')

prepare() {
  cd u-boot-xlnx

  patch -Np1 < ../0001-python-use-python2.patch
}

pkgver() {
  cd u-boot-xlnx

  git describe | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

build(){
  cd u-boot-xlnx

  make zynq_zc70x_config ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
}

package() {
  cd u-boot-xlnx

  install -Dm755 tools/mkimage "${pkgdir}/usr/bin/arm-linux-gnueabihf-mkimage"
  install -Dm755 u-boot "${pkgdir}/usr/lib/u-boot/zc70x/u-boot"
  install -Dm644 doc/mkimage.1 \
    "${pkgdir}/usr/share/man/man1/arm-linux-gnueabihf-mkimage.1"

  strip "${pkgdir}/usr/bin/arm-linux-gnueabihf-mkimage"
  arm-linux-gnueabihf-strip "${pkgdir}/usr/lib/u-boot/zc70x/u-boot"
}
