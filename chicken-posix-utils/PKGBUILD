# Maintainer: Aaron P <aaronbpaden@gmail.com>

pkgname=chicken-posix-utils
_pkgname=posix-utils
pkgver=1.0.0
pkgrel=1
pkgdesc="Miscellaneous Posix related routines."
arch=('i686' 'x86_64')
url="http://wiki.call-cc.org/eggref/4/posix-utils"
license=('BSD')
depends=('chicken' 'chicken-setup-helper')

build() {
  cd "$srcdir/"
  chicken-install -r "${_pkgname}":"${pkgver}"
}
package() {
  cd "$_pkgname"
  CHICKEN_INCLUDE_PATH=/usr/lib/chicken/7/ chicken-install -p "$pkgdir/usr"
}
