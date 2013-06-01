# Maintainer: Julien Schueller <schueller at phimeca dot com>

pkgname=otsvm-svn
pkgver=0.0
pkgrel=1
pkgdesc="OpenTURNS SVM library extension module"
arch=('i686' 'x86_64')
url="http://www.openturns.org"
license=('LGPL3')
depends=('openturns' 'libsvm')
makedepends=('cmake' 'gcc' 'openturns' 'libsvm')
# source=('')
# md5sums=('')

build() {
  svn co https://svn.openturns.org/openturns-modules/openturns-svm/trunk $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
          -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
          -DPYTHON_EXECUTABLE=/usr/bin/python2
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}