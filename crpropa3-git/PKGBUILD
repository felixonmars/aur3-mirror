# Maintainer: Gero Müller <gero.mueller@physik.rwth-aachen.de>

pkgname='crpropa3-git'
pkgver=20150217.4d25945
pkgrel=3
pkgdesc="Cosmic Ray Propagation Tool"
arch=('i686' 'x86_64')
url="https://github.com/crpropa/crpropa3"
license=('BSD')
depends=('fftw' 'python' 'quimby-hg' 'root' 'muparser')
makedepends=('git' 'cmake' 'swig')
source=("$pkgname::git+https://github.com/crpropa/crpropa3.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  mkdir -p $srcdir/build-python2
  cd $srcdir/build-python2
  PYTHON_EXECUTABLE=/usr/bin/python2 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $srcdir/$pkgname
  make

  mkdir -p $srcdir/build-python3
  cd $srcdir/build-python3
  ln -sf $srcdir/build-python2/data.tar.gz
  PYTHON_EXECUTABLE=/usr/bin/python3 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/build-python2
  make DESTDIR="$pkgdir" install

  cd $srcdir/build-python3
  make DESTDIR="$pkgdir" install
}
