# Maintainer: Gero Mueller <post@geromueller.de>
pkgname=pxl
pkgver=3.3.1
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Physics Extension Library"
depends=('python2' 'zlib' 'expat' 'libssh2')
makedepends=('swig' 'cmake')
url="http://forge.physik.rwth-aachen.de/projects/pxl"
source=(https://forge.physik.rwth-aachen.de/attachments/download/200/pxl-3.3.1.tar.gz)
md5sums=('0624a564f61ce9a56d9118f82c812eb0')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  cmake . -DPYTHON_EXECUTABLE=`which python2` -DENABLETESTING=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
