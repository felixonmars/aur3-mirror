pkgname=xcurf
pkgver=0.1
pkgrel=1
pkgdesc="X Cursor Flag"
arch=(i686 x86_64)
url="http://xneur.ru/wiki/Another"
license=('GPL')
depends=(imlib2)
source=(http://dists.xneur.ru/xcurf/xcurf-$pkgver.tar.gz)
md5sums=('548384eaaaf432cdbc47f39185d1e64b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --docdir=/usr/share/doc
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  mv $pkgdir/usr/doc $pkgdir/usr/share/
}
