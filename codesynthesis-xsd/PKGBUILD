# Maintainer: Tim Diels <tim@timdiels.be>
pkgname=codesynthesis-xsd
pkgver_major=3.3
pkgver_minor=0
pkgver=${pkgver_major}.${pkgver_minor}
pkgrel=1
pkgdesc="A cross-platform W3C XML Schema to C++ data binding compiler"
url='http://www.codesynthesis.com/products/xsd/'
arch=('x86_64')
license=('GPL2')
depends=()
makedepends=()
source=("http://www.codesynthesis.com/download/xsd/$pkgver_major/linux-gnu/$arch/xsd-${pkgver}-$arch-linux-gnu.tar.bz2")
md5sums=('62cf1291e210eba37738d5a02f7d2990')

build() {
  cd ${srcdir}/xsd-*
  install -m555 -D bin/xsd $pkgdir/usr/bin/codesynthesis-xsd
  install -d $pkgdir/usr/include 
  mv libxsd/xsd $pkgdir/usr/include
}
