# Contributor: Victor Noël

_realpkgname=yarp
pkgname=python2-$_realpkgname
pkgver=2.3.63
pkgrel=1
pkgdesc="Yet Another Robot Platform"
url="http://eris.liralab.it/yarp/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'swig')
depends=('yarp' 'python2')
options=(!libtool)
source=(http://downloads.sourceforge.net/yarp0/$_realpkgname-$pkgver.tar.gz)
md5sums=('3e0243e09276d716ac317413c753037f')


build() {
  mkdir build-$pkgname-$pkgver
  cd build-$pkgname-$pkgver

  cmake ../$_realpkgname-$pkgver/example/swig/ -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DCMAKE_INSTALL_PREFIX=/usr -DCREATE_PYTHON=TRUE
  make
}

package() {
  cd $srcdir/build-$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
