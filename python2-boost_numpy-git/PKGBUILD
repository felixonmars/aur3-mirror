# Maintainer: ...
pkgname=python2-boost_numpy-git
#_pkgname=pt3_drv
pkgver=r122.7ff5465
pkgrel=1
pkgdesc="Boost Numpy for python2"
arch=('x86_64')
url="https://github.com/ndarray/Boost.NumPy"
license=('GPL')
depends=('python2' 'boost' 'python2-numpy')
makedepends=('git')
provides=('python2-boost_numpy')
#install=dkms.install
source=("$pkgname"::'git+https://github.com/ndarray/Boost.NumPy')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  #patch -Np1 -i "$srcdir/remove-make-dkms.patch"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so ../
  make -j2
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR=${pkgdir} install

}

# vim:set ts=2 sw=2 et:
sha1sums=('SKIP')
