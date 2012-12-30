# Maintainer: TDY <tdy@gmx.com>

pkgname=adiff
pkgver=1.4
pkgrel=1
pkgdesc="A wordwise diff implementation"
arch=('i686' 'x86_64')
url="http://agriffis.n01se.net/adiff/"
license=('GPL')
depends=('diffutils' 'perl')
source=(http://agriffis.n01se.net/adiff/adiff-$pkgver)
md5sums=('e9b710985a9d1831d366393515ff1b50')

package() {
  cd "$srcdir"
  pod2man --release=$pkgver --center=$url --date=2007-12-11 \
    adiff-$pkgver adiff.1
  install -Dm755 adiff-$pkgver "$pkgdir/usr/bin/adiff"
  install -Dm644 adiff.1 "$pkgdir/usr/share/man/man1/adiff.1"
}
