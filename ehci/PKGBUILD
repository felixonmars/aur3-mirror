# Maintainer: wakwanza <hecate9@<google>.com>
pkgname=ehci
pkgver=0.7
pkgrel=1
pkgdesc="Enhanced human computer interface through image processing"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ehci"
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig')
depends=('opencv')
source=("http://ehci.googlecode.com/files/${pkgname}-${pkgver}-src.zip")
md5sums=('4fd03056d067cb191ca6e5e0c26e641b')

build() {
  cd "$startdir/src/${pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr/lib
  make
}

package() {
  cd "$startdir/src/${pkgname}"
  make DESTDIR=${pkgdir}install
}