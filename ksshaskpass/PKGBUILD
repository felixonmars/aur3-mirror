# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ksshaskpass
pkgver=5.1.95
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet and kpassworddialog'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/ksshaskpass'
license=('LGPL')
groups=('plasma-next')
depends=('kwallet')
makedepends=('extra-cmake-modules' 'kdoctools')
source=("http://download.kde.org/unstable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('f6dd21e9d56456be720ddc8cb45b95a7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ksshaskpass-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
