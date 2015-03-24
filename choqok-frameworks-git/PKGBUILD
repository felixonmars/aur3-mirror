# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=choqok-frameworks-git
pkgver=r1798.1ac8de8
pkgrel=1
pkgdesc='Microblogging client for KDE with support for Pump.io, GNU social and Twitter.com'
arch=(i686 x86_64)
url='http://choqok.gnufolks.org/'
license=(GPL)
depends=(kdelibs4support knotifyconfig qoauth-git)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(choqok)
provides=(choqok)
source=("git://anongit.kde.org/choqok.git#branch=frameworks")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd choqok
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../choqok \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
