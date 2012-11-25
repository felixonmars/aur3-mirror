# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-mobile
pkgver=0.4
pkgrel=1
pkgdesc="Plasma Active is intended for all types of tablets, smartphones and touch computing devices"
arch=(i686 x86_64)
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-workspace' 'kde-artwork-active')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
install=${pkgname}.install
source=("http://download.kde.org/stable/active/3.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('5d4bd547a61009044cfa68e898252ae5')

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
