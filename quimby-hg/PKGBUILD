# Maintainer: Gero Müller <gero.mueller@physik.rwth-aachen.de>

pkgname='quimby-hg'
pkgver=152.c4a14d592503
pkgrel=2
pkgdesc="Fast Multi Resolution Grid and Gadget File Library"
arch=('i686' 'x86_64')
url="https://forge.physik.rwth-aachen.de/public/quimby"
license=('BSD')
depends=('python')
makedepends=('mercurial' 'cmake' 'swig')
source=("$pkgname::")
_hgroot=https://forge.physik.rwth-aachen.de/hg
_hgrepo=quimby
source=("$_hgrepo::hg+$_hgroot/$_hgrepo")
md5sums=('SKIP')


pkgver() {
  cd $srcdir/$_hgrepo
  echo $(hg identify -n | head -2 | tail -1).$(hg identify -i | head -2 | tail -1)
}

build() {
  mkdir -p "$srcdir/$_hgrepo"/build-python2
  cd "$srcdir/$_hgrepo"/build-python2
  PYTHON_EXECUTABLE=/usr/bin/python2 cmake  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQUIMBY_ENABLE_PYTHON=On -DQUIMBY_ENABLE_TESTING=Off -DQUIMBY_ENABLE_ROOT=Off -DBUILD_SHARED_LIBS=On ..

  mkdir -p "$srcdir/$_hgrepo"/build-python3
  cd "$srcdir/$_hgrepo"/build-python3
  PYTHON_EXECUTABLE=/usr/bin/python3 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQUIMBY_ENABLE_PYTHON=On -DQUIMBY_ENABLE_TESTING=Off -DQUIMBY_ENABLE_ROOT=Off -DBUILD_SHARED_LIBS=On ..
}

package() {
  cd "$srcdir/$_hgrepo/build-python2"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$_hgrepo/build-python3"
  make DESTDIR="$pkgdir/" install
}
