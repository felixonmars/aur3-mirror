# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=packagekit-qt5
pkgver=0.9.5
pkgrel=1
pkgdesc="Qt5 bindings for PackageKit"
arch=('i686' 'x86_64')
url="http://www.packagekit.org/"
license=('LGPL')
depends=('qt5-base' 'packagekit>=1')
source=("http://www.freedesktop.org/software/PackageKit/releases/PackageKit-Qt-$pkgver.tar.xz")
md5sums=('520448ff32aaf338c1ac5f97690d6691')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../PackageKit-Qt-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
