# Maintainer: Christian Menard <chrism333@gmx.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde-artwork-active
pkgver=0.4
pkgrel=1
pkgdesc="Artworks for Plasma Active"
arch=('any')
url='http://plasma-active.org/'
license=('LGPL')
makedepends=('kdelibs' 'cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/4.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('92a1a7dbb89d0c18cc4b510f854c5e11')

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
