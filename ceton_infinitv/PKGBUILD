# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ceton_infinitv
pkgver=2013.0326.2226
pkgrel=3
pkgdesc="Driver for Ceton InfiniTV"
arch=('i686' 'x86_64')
url="http://cetoncorp.com/infinitv_support/linux_drivers"
license=('GPL')
depends=('linux-headers')
source=(http://www.cetoncorp.com/downloads/${pkgname}_linux_driver_2013_0326_2226.tar.gz
	kernel.patch
	no-date-time-warn.patch)
sha256sums=(36f7cf010a705b283f165e9dd611dac6ef4729c55466752c3b70f3ffcc6d47d2
	    dd642a60ba15bdada535beb000d8bddd87d0f97c70b1d37f7fa0e0af9e6b464c
	    929a93e8fc35746de1a515e23a3dfe30e39573ea40d0c2e492be59f630f87918)
install=${pkgname}.install

prepare() {
  cd $srcdir/${pkgname}_linux_driver
  patch -p1 -i $srcdir/kernel.patch
  patch -p1 -i $srcdir/no-date-time-warn.patch
}

build() {
  cd "$srcdir/${pkgname}_linux_driver"
  make
}

package() {
  cd "$srcdir/${pkgname}_linux_driver"
  KERNEL_VERSION=`pacman -Qi linux | grep "Version" | sed 's/^Version\s*:\s//'`
  install -D -m644 ctn91xx.ko ${pkgdir}/usr/lib/modules/${KERNEL_VERSION}-ARCH/extramodules/ctn91xx.ko
  gzip -9 ${pkgdir}/usr/lib/modules/${KERNEL_VERSION}-ARCH/extramodules/ctn91xx.ko
  install -D -m644 98-ctn91xx.rules ${pkgdir}/etc/udev/rules.d/98-ctn91xx.rules
}
