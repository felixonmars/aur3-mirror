# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=msp430-launchpad-uart-fix
pkgver=3
pkgrel=1
pkgdesc="Kernel module fix for the msp430 launchpad uart"
arch=('i686' 'x86_64')
url="http://hypertriangle.com/"
license=('GPL')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.install")
depends=("linux")
makedepends=("linux-headers")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D -m644 cdc-acm.ko ${pkgdir}/lib/modules/$(uname -r)/updates/cdc-acm.ko
}    

md5sums=('8011670279c739e208bd3926b76cc35a'
         'c3676748519977c008b119d75f98aeda')
md5sums=('fd0efac4654a87d715ebdde0f0f35099'
         'c3676748519977c008b119d75f98aeda')
