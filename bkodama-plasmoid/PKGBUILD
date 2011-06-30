# Maintainer:  mond
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net>

pkgname=bkodama-plasmoid
pkgver=0.3.1
pkgrel=1
pkgdesc="A friendly (yet very simple-minded) Kodama wandering on your desktop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/bkodama?content=106528"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
install="${pkgname}.install"
source=(http://www.kde-look.org/CONTENT/content-files/106528-bkodama-${pkgver}.tar.bz2)
md5sums=('8f00c4c50f06bd91a0e8ad02553e6390')

build() {
  mkdir build
  cd build
  cmake ../bkodama-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE="Release"
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
