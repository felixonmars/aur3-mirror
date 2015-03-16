 
# Maintainer: Antonis Geralis 

pkgname=kdocumentstore-git
pkgver=r5.f3a45d9
pkgrel=1
pkgdesc='A library to store QVariants and QVariantMaps.'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('GPL')
depends=('qt5-base' 'ki18n' 'libtcejdb')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
optdepends=()
conflicts=('kvariantstore' 'kdocumentstore')
provides=('kvariantstore' 'kdocumentstore')
source=("git://anongit.kde.org/kdocumentstore.git")
#install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd kdocumentstore
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kdocumentstore \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
