# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>

pkgname=krest-git
pkgver=7.a1a5496
pkgrel=1
pkgdesc="A Qt5 REST-api client"
arch=('i686' 'x86_64')
url="https://gitorious.org/krest/krest"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('krest')
provides=('krest')
source=('git+https://gitorious.org/krest/krest.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/krest"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/krest"
  qmake-qt5 krest.pro
  make
}

package() {
  cd "${srcdir}/krest"
  mkdir -p "${pkgdir}/usr/bin"
  cp krest "${pkgdir}/usr/bin"
#  make DESTDIR="$pkgdir/" install
}
