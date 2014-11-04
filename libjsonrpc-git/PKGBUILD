# Maintainer: Daniel Bomar <dbdaniel42@gmail.com>

pkgname=libjsonrpc-git
pkgver=20141102
pkgrel=1
pkgdesc="C++ framework for json-rpc (json remote procedure call)"
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
arch=('i686' 'x86_64')
depends=('curl' 'argtable' 'jsoncpp')
optdepends=('boost: automated tests')
makedepends=('git' 'cmake')
install=libjsonrpc-git.install
source=('git://github.com/cinemast/libjson-rpc-cpp.git')
sha256sums=('SKIP')

build() {
  mkdir "${srcdir}/libjson-rpc-cpp/build"
  cd "${srcdir}/libjson-rpc-cpp/build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "${srcdir}/libjson-rpc-cpp/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/libjson-rpc-cpp/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
