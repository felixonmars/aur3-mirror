# Maintainer: Antonio Rojas <arojas@archlinux.org> 

pkgname=muon-frameworks
pkgver=5.1.95
pkgrel=2
pkgdesc='A collection of package management tools for KDE'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/muon'
groups=('plasma-next')
license=('LGPL')
depends=('packagekit-qt5' 'kdeclarative' 'appstream-qt')
makedepends=('extra-cmake-modules' 'python')
conflicts=('muon')
source=("http://download.kde.org/unstable/plasma/$pkgver/muon-$pkgver.tar.xz")
md5sums=('2fa2eda659b77b0132f1da6875a80fe6')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../muon-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
