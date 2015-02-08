# Maintainer: FX-Ti <zjxiang1998@gmail.com>
# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=acr122u_driver
pkgver=1.0.4
pkgrel=3
pkgdesc="The ACR122U Reader Driver"
arch=('i686' 'x86_64')
url="http://www.acs.com.hk/"
license=('GPL')
makedepends=('make')
source=('acsccid-1.0.4.tar.bz2')
md5sums=('c03fea8824766097845b3492f57b0296')


build() {
  cd "acsccid-$pkgver"
  ./configure
  make -j3 || return 1
}

package() {
  cd "acsccid-$pkgver"
  make DESTDIR="${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
