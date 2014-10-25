# Maintainer: Antonio Rojas

pkgname=kabc-git
pkgver=r18667.1791438
pkgrel=1
pkgdesc="KDE PIM Libraries"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdepimlibs'
license=('GPL' 'LGPL')
depends=('kcoreaddons' 'kconfig' 'ki18n' 'kcodecs')
makedepends=('extra-cmake-modules' 'git' 'python')
conflicts=('kdepimlibs-git')
source=('git://anongit.kde.org/kdepimlibs.git')
md5sums=('SKIP')

pkgver() {
  cd kdepimlibs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdepimlibs/kabc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
