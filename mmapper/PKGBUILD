pkgname=mmapper
pkgver=2.2.1
pkgrel=2
pkgdesc="MMapper2 is a mapping tool for the MUME mud."
arch=('i686' 'x86_64')
url="http://mume.org/wiki/index.php/Mmapper"
depends=('qt4' 'zlib')
makedepends=('cmake')
license=('GPL')
source=(http://sourceforge.net/projects/mmapper/files/mmapper/mmapper%20${pkgver}/mmapper-${pkgver}-source.tar.gz)
sha256sums=('344da2503da997ae55c44c78b91dbe3e8c34c461d4af077184244559fceb209c')

_srcdir=$pkgname-$pkgver-source

build() {
  cd ${srcdir}/${_srcdir}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package () {
  cd ${srcdir}/${_srcdir}/build
  make DESTDIR=${pkgdir} install
}
