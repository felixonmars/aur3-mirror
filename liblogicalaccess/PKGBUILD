pkgname=liblogicalaccess
pkgver=1.76.2
pkgrel=1
pkgdesc="RFID Library in C++/C#"
arch=('i686' 'x86_64')
url="http://liblogicalaccess.islog.com/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("https://github.com/islog/liblogicalaccess/archive/${pkgver}.tar.gz")
md5sums=('3aa1117cce4563e1584e7c72c1d2d3b3')

build () {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package () {
  cd "$srcdir/${pkgname}-${pkgver}"
  pushd build
  make install DESTDIR="$pkgdir"
}
