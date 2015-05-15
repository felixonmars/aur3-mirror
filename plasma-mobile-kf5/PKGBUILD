# Contributor: krazedkrish <krazedkrish@gmail.com>

pkgname=plasma-mobile-kf5
pkgver=20150514
pkgrel=1
pkgdesc="Plasma Active is intended for all types of tablets, smartphones and touch computing devices"
arch=(i686 x86_64)
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-workspace' 'kde-artwork-active-git')
makedepends=('cmake' 'automoc4')
groups=('plasma-active-kf5')
install=${pkgname}.install
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone --branch frameworks --depth 1 git://anongit.kde.org/plasma-mobile ${pkgname}-${pkgver}
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
