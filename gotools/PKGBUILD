# Maintainer: Jan Rüegg <rggjan@gmail.com>
pkgname=gotools
pkgver=4.2.0
pkgrel=1
pkgdesc="GoTools is the name of a collection of C++ libraries related to geometry"
arch=('i686' 'x86_64')
url="http://www.sintef.no/Projectweb/Geometry-Toolkits/GoTools/"
license=('unknown')
makedepends=('cmake' 'lsb-release')
source=("http://www.sintef.no/upload/IKT/9011/geometri/GoTools/GoTools-$pkgver.tar.gz")
md5sums=('3b8f68255735ca87e393de2fca722c0c') #generate with 'makepkg -g'

build() {
  cd "$srcdir/GoTools-$pkgver"
  
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..

  make
}

package() {
  cd "$srcdir/GoTools-$pkgver/build"
  make install
}

# vim:set ts=2 sw=2 et:
