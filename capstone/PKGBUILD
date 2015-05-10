# Maintainer: M0Rf30

pkgname=capstone
pkgver=3.0.3
pkgrel=1
pkgdesc='A lightweight multi-platform, multi-architecture disassembly framework.'
arch=('i686' 'x86_64')
url='http://www.capstone-engine.org/index.html'
license=('BSD')
depends=('glibc')
source=("http://capstone-engine.org/download/$pkgver/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}

md5sums=('ee8b90ac5a26e21d9a9f58871a8f0844')
