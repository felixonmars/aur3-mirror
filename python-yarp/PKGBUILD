# Contributor: Victor Noël

_realpkgname=yarp
pkgname=python-$_realpkgname
pkgver=2.3.63
pkgrel=1
pkgdesc="Yet Another Robot Platform"
url="http://eris.liralab.it/yarp/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'swig')
depends=('yarp' 'python')
options=(!libtool)
source=(http://downloads.sourceforge.net/yarp0/$_realpkgname-$pkgver.tar.gz yarp-swig-python3.patch)
md5sums=('3e0243e09276d716ac317413c753037f'
         '50a0e9427d6739ef08c1b52db3be7596')


prepare() {
  cd $srcdir/$_realpkgname-$pkgver/example/swig

  # -DSWIG_MODULE_python_EXTRA_FLAGS=-py3 does not do anything apparently... so we gruikly patch
  patch -N -p1 < $srcdir/yarp-swig-python3.patch
}

build() {
  mkdir build-$pkgname-$pkgver
  cd build-$pkgname-$pkgver

  cmake ../$_realpkgname-$pkgver/example/swig/ -DPYTHON_EXECUTABLE=/usr/bin/python -DPYTHON_LIBRARY=/usr/lib/libpython3.so -DCMAKE_INSTALL_PREFIX=/usr -DCREATE_PYTHON=TRUE
  make
}

package() {
  cd $srcdir/build-$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
