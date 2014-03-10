# Maintainer: Matt Renaud <mrenaud92@gmail.com>
pkgname=libdlibxx
pkgver=1.0.0
pkgrel=3
pkgdesc="A C++11 library for loading symbols from dynamic libraries."
arch=('i686' 'x86_64')
url="https://github.com/mrenaud92/libdlibxx"
license=('FreeBSD')
depends=('gcc-libs' 'cmake' 'boost')
provides=('libdlibxx')
install=$pkgname.install
source=("http://mrenaud.ca/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9344a4a9e3e1e4f1dbb794eb19d2f990')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir" .
  make
}

package() {
  cd $pkgname-$pkgver

  make install
}

# vim:set ts=2 sw=2 et:
