# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=tardy
pkgver=1.25
pkgrel=1
pkgdesc="A tar post-processor to manipulate the file headers in various ways."
arch=(i686 x86_64)
url="http://tardy.sourceforge.net/"
license=('GPL3')
depends=('zlib' 'libexplain')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('27e1b625488d824d6e95412ba88c0651')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
