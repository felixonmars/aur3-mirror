# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=ceton_infinitv-aufs_friendly
pkgver=1.7
pkgrel=1
pkgdesc="Driver for Ceton InfiniTV built for AuFS Friendly Kernel"
arch=('i686' 'x86_64')
url="http://www.cetoncorp.com/infinitv/support/linux.php"
license=('GPL')
depends=('linux-aufs_friendly')
source=(http://cetoncorp.com/downloads/ceton_infinitv_linux_driver_1_7.tar.gz)
install=ceton_infinitv.install
sha256sums=('c478217a2937f5b530424f2380a512f1cfb88c587df82a29b6e8a2c6277e45ac')
provides=('ceton_infinitv')
conflicts=('ceton_infinitv')

build() {
  cd "$srcdir/ceton_infinitv_linux_driver"
  make
}

package() {
  cd "$srcdir/ceton_infinitv_linux_driver"
  KERNEL_VERSION=`uname -r`
  KERNEL_DIR=/lib/modules/$KERNEL_VERSION/build
	install -D -m644 ctn91xx.ko $pkgdir/lib/modules/$KERNEL_VERSION/extra/ctn91xx.ko
	gzip -9 $pkgdir/lib/modules/$KERNEL_VERSION/extra/ctn91xx.ko
	install -D -m644 98-ctn91xx.rules $pkgdir/etc/udev/rules.d/98-ctn91xx.rules
}

# vim:set ts=2 sw=2 et:
