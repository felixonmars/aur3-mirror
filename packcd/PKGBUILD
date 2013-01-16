# Maintainer: TDY <tdy@archlinux.info>

pkgname=packcd
pkgver=0.7
pkgrel=1
pkgdesc="A utility for packing files, either sequentially or efficiently, onto a set of CDs"
arch=('i686' 'x86_64')
url="http://offog.org/code/"
license=('MIT')
depends=('cdrkit')
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('44897008ef68717b6514243e7ea9a2a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
