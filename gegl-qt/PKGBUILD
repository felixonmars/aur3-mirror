# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=gegl-qt
pkgver=0.0.7
pkgrel=1
pkgdesc="Convenience library for using GEGL in Qt applications" 
arch=(i686 x86_64)
url="http://www.gegl.org"
license=('LGPLv3+')
depends=('gegl' 'qt' 'python2' 'pyside' 'pygobject2-devel' 'doxygen')
# pyside, python2, pygobject2-devel: for python bindings
# doxygen: for documentation
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(http://www.jonnor.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('fbb0692af354d404615980a68c8a88f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # BUILD
  export PYTHON=/usr/bin/python2
  qmake -r
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
} 
