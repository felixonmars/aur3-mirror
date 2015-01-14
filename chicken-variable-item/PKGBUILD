# Maintainer: Aaron P <aaronbpaden@gmail.com>
pkgname=chicken-variable-item
_pkgname=variable-item
pkgver=1.3.1
pkgrel=1
pkgdesc="Various useful forms."
arch=('i686' 'x86_64')
url="http://wiki.call-cc.org/eggref/4/variable-item"
license=('MIT')
depends=('chicken' 'chicken-setup-helper' 'chicken-check-errors')

build() {
  cd "$srcdir/"
  chicken-install -r "${_pkgname}":"${pkgver}"
}
package() {
  cd "$_pkgname"
  chicken-install -p "$pkgdir/usr"
}
