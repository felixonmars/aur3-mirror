# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kcmsystemd
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd control module for KF5"
arch=('i686' 'x86_64')
url='https://github.com/rthomsen/kcmsystemd'
license=('GPL')
depends=('boost-libs' 'ki18n' 'kauth' 'kcoreaddons' 'kconfigwidgets' 'python')
makedepends=('extra-cmake-modules' 'boost')
conflits=('kcmsystemd-kde4' 'kcmsystemd-git')
provides=('kcmsystemd')
source=("https://github.com/rthomsen/kcmsystemd/archive/${pkgver}.tar.gz")
md5sums=('6233faf3cd8569b360c21c38d0d06d7f')

build() {
  cd kcmsystemd-${pkgver}
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd kcmsystemd-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
