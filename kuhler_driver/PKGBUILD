# Maintainer: Eero Molkoselka <molkoback@gmail.com>

pkgname=kuhler_driver
pkgver=0.61
pkgrel=1
pkgdesc="Linux Driver and control program for the Antec H20 - 920 Series liquid coolers"
url="http://sourceforge.net/projects/kuhlerdriver"
arch=('any')
license=('GPLv3')
depends=('libusb-compat')
makedepends=('make')
source=("http://sourceforge.net/projects/kuhlerdriver/files/${pkgname}-${pkgver}.tar.gz/download")

build() {
  make all
}

package() {
  install -Dm 755 kuhlerd "$pkgdir/usr/bin/kuhlerd"
  install -Dm 755 kuhler_ctl "$pkgdir/usr/bin/kuhler_ctl"
}

sha256sums=('1983f92ea3ebaae226e95938225ece4d60addc59f32d1373dca147916822c149')