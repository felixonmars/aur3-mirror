# Maintainer: Daniel Bomar <dbdaniel42@gmail.com>
# Contributor: Daniel Sage <daniel@ceri.co>
# Author: Jonahtan Schaeffer <joschaeffer@gmail.com>

pkgname=jsonrpc-cpp
pkgver=0.5
pkgrel=2
pkgdesc="A C++ implementation of JSONRPC v2 protocol"
url="http://jsonrpc-cpp.sourceforge.net/"
license=("LGPL3")
arch=("i686" "x86_64")
depends=("jsoncpp" "curl")
makedepends=("gcc")
source=("http://downloads.sourceforge.net/project/jsonrpc-cpp/jsonrpc-cpp/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('772f7ff63adafba7a5fd9f947ad0d1df9f692f017cb2b1ffc629377314aa7b6b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix /usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
