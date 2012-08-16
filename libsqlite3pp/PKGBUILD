# Maintainer: Your Name <youremail@domain.com>
pkgname=libsqlite3pp
pkgver=0.3.5
pkgrel=4
pkgdesc="SQLite3 C++ API"
arch=(x86 x86_64)
url="https://bitbucket.org/amrhassan/libsqlite3pp"
license=('GPL')
depends=(sqlite3 boost-libs)
makedepends=(cmake sqlite3 boost)
source=("https://bitbucket.org/amrhassan/libsqlite3pp/downloads/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir"
  
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir"
  
  make DESTDIR="$pkgdir/" install
}

md5sums=('5511a3ff8352bbafaad44fb296d1abb4')
