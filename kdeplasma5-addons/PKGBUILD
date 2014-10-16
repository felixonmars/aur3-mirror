# Maintainer: Antonio Rojas

pkgname=kdeplasma5-addons
_pkgname=kdeplasma-addons
pkgver=5.1.0.1
pkgrel=1
pkgdesc="All kind of addons to improve your Plasma experience"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdeplasma-addons'
license=('LGPL')
depends=('plasma-workspace' 'kcmutils')
makedepends=('kdoctools' 'extra-cmake-modules' 'scim' 'libibus' 'python')
source=("http://download.kde.org/stable/plasma/5.1.0/$_pkgname-$pkgver.tar.xz")
md5sums=('3b65b3334ad67db7ff536ce38c857175')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-5.1.0 \
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
