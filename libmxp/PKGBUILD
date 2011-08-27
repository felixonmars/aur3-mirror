# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=libmxp
pkgver=0.2.4
pkgrel=2
pkgdesc="MUD eXtension Protocol library."
arch=('i686' 'x86_64')
url="http://www.kmuddy.com/libmxp"
license=('LGPL')
depends=()
makedepends=('cmake')
source=("http://www.kmuddy.com/libmxp/files/$pkgname-$pkgver.tar.gz")
md5sums=('4700429a4d39f1e3f4bb081173a50a87')

build() {
  
  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$pkgname-$pkgver -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr

  make || return 1
  make DESTDIR=${pkgdir} install
}
