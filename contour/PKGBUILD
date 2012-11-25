# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=contour
pkgver=0.3
pkgrel=1
pkgdesc="Shell and frameworks for Plasma Active"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-mobile' 'qtmobility')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/3.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('fcaa196db5ca5af7699efcbd046d1cd7')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}
