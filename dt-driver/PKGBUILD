# Maintainer: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=dt-driver
pkgver=1.1
pkgrel=3
pkgdesc="ENAC's Linux kernel driver for DiamondTouch."
arch=('i686' 'x86_64')
url='http://lii-enac.fr/en/projects/shareit/linux.html'
license=('GPL')
depends=('kernel26')
makedepends=('kernel26-headers')
install='dt-driver.install'
source=("http://lii-enac.fr/en/projects/shareit/${pkgname}.tar.gz"
        "dt-driver-fix-kmalloc.patch")
md5sums=('8432134b072dd8a685fcddba23bc1baa'
         'f7066f32cdf4fbac6dd5932d7fbe9d81')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p2 -i "${srcdir}/${pkgname}-fix-kmalloc.patch" || return 1
  make || return 1
  gzip -c "${srcdir}/${pkgname}-${pkgver}/diamondtouch.ko" > "${srcdir}/${pkgname}-${pkgver}/diamondtouch.ko.gz"
}

package() {
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/diamondtouch.ko.gz" "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/input/touchscreen/diamondtouch.ko.gz" || return 1
}
