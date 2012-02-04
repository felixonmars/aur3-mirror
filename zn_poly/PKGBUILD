# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Maintainer: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=zn_poly
pkgver=0.9
pkgrel=1
pkgdesc="Polynomial arithmetic over Z/nZ"
arch=('i686' 'x86_64')
url="http://cims.nyu.edu/~harvey/zn_poly/"
license=('GPL')
depends=()
source=(http://cims.nyu.edu/~harvey/zn_poly/releases/$pkgname-$pkgver.tar.gz)
md5sums=('0eeaae2524addf558de94bfbc914d22e')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1

  install -D -m 644 libzn_poly.a "$pkgdir"/usr/lib/libzn_poly.a
  install -d "$pkgdir"/usr/include/zn_poly
  install include/zn_poly.h include/wide_arith.h "$pkgdir"/usr/include/zn_poly
}

