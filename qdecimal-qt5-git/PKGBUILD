# Maintainer: ant32 <antreimer@gmail.com>

pkgname=qdecimal-qt5-git
pkgver=19.4782dac
pkgrel=2
pkgdesc="QDecimal class for general decimal arithmetic access in Qt5"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qdecimal"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('qdecimal-qt5')
provides=('qdecimal-qt5')
source=('git+https://code.google.com/p/qdecimal/')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/qdecimal"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/qdecimal"
  sed -i 's/ test//' qdecimal.pro
  qmake-qt5 qdecimal.pro
  make
}

package() {
  cd "${srcdir}/qdecimal"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
