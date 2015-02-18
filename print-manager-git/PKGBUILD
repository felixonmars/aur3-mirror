# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=print-manager-git
pkgver=r668.0accaed
pkgrel=1
pkgdesc='A tool for managing print jobs and printers'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdeutils/print-manager'
license=('GPL')
depends=('kcmutils' 'plasma-framework' 'libcups')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('kdeutils-print-manager' 'print-manager')
provides=('print-manager')
source=("git://anongit.kde.org/print-manager.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd print-manager
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../print-manager \
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
