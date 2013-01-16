# Maintainer: TDY <tdy@archlinux.info>

pkgname=adiff
pkgver=1.4
pkgrel=1
pkgdesc="A wordwise diff implementation"
arch=('any')
url="http://agriffis.n01se.net/adiff/"
license=('GPL')
depends=('diffutils' 'perl')
source=(http://agriffis.n01se.net/$pkgname/$pkgname-$pkgver)
md5sums=('e9b710985a9d1831d366393515ff1b50')

build() {
  cd "$srcdir"
  pod2man $pkgname-$pkgver $pkgname.1 \
    --release=$pkgver \
    --center=$url \
    --date=2007-12-11
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
