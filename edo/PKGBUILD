#Contributor: Sebastien Piccand <sebcactus gmail com>
pkgname=edo
pkgver=1.3.1
pkgrel=1
pkgdesc="EDO is an extension of EO oriented toward Estimation-of-Distribution-like Algorithms"
arch=('i686' 'x86_64')
url="http://eodev.sourceforge.net/"
license=('LGPL')
depends=('eigen2' 'eo')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/project/eodev/eo/$pkgver/EO-$pkgver.zip)
md5sums=('99ebeff7bc7cab2db7b7ec0bff2289ca')

build() {
  cd "$srcdir"
  mkdir $pkgname-build
  cd $pkgname-build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DWITH_EIGEN=ON ../$pkgname
  make
}

package() {
  cd "$srcdir"/$pkgname-build
  make DESTDIR="$pkgdir" install
  # clean build
  rm -r "$srcdir"/$pkgname-build
}
