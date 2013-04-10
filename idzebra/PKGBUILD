# Maintainer: corvolino <corvolinowins@gmail.com>

pkgname=idzebra
pkgver=2.0.54
pkgrel=1
pkgdesc="High-performance, general-purpose structured text indexing and retrieval engine."
arch=("i686" "x86_64")
url=("http://indexdata.dk/zebra")
license=('GPL')
depends=("yaz" "expat")
makedepends=("make" "gcc")
source=("http://ftp.indexdata.dk/pub/zebra/${pkgname}-${pkgver}.tar.gz")
md5sums=("864b1647e05b00fdac395967910ef838")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
