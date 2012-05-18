# Maintainer: Samsagax <samsagax@gmail.com>

pkgname=libdxfrw
pkgver=0.4.2
pkgrel=1
pkgdesc="C++ library to read/write DXF files in binary and ascii form."
arch=("any")
url="http://sourceforge.net/projects/libdxfrw/"
license=('GPL2')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('68778df1839410f8db5763c71ee3814c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
