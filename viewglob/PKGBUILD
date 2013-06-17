# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: itlain <esears@fluxback.net>

pkgname=viewglob
pkgver=2.0.4
pkgrel=3
pkgdesc="A utility designed to complement the Unix shell in a graphical environment"
arch=(i686 x86_64)
url="http://viewglob.sourceforge.net/index.html"
license=('GPL')
depends=('gtk2')
makedepends=('libsm')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7956a2e922a716bd0da30488e4ffb486')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  LIBS=" -lm" \
  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
