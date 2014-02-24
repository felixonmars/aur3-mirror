# Maintainer: Markus Unterwaditzer <markus[AT]unterwaditzer.net>
pkgname=hummstrummengine
pkgver=0.7.0
pkgrel=1
pkgdesc="Graphics engine for the game Humm and Strumm"
url="http://hummstrumm.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('eigen' 'intel-tbb' 'boost')
makedepends=('cmake')
optdepends=('cppunit: For the unit tests.',
            'doxygen: Documentation compilation.',
            'texlive-core: Documentation compilation.')
source=("http://downloads.sourceforge.net/project/hummstrumm/Source/hummstrummengine-0.7.0.tar.gz")
md5sums=('45c4cc1b90f288207d8081f4cd1f3f4f')

build() {
  cd "$srcdir/hummstrummengine-$pkgver"
  unset CXXFLAGS
  unset CFLAGS
  cmake -DWITH_UNIT_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/hummstrummengine-$pkgver"
  make DESTDIR="$pkgdir" install
}

#check() { # this one needs cppunit installed
  #cd "$srcdir/hummstrumm-$pkgver"
  #make test
#}
