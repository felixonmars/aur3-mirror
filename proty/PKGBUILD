# Maintainer: Thomas Gatzweiler <thomas.gatzweiler at gmail com>
pkgname=proty
pkgver=0.5
pkgrel=1
pkgdesc="A dynamic, prototype based programming language."
arch=(i686 x86_64)
url="http://www.proty.cc"
license=GPL3
depends=('readline')
makedepends=('cmake>=2.8')
source=("http://ftp.proty.cc/proty/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3eb7488ffc13b4d69fceb9370c5cc37f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}