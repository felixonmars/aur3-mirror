# Maintainer: ant32 <antreimer@gmail.com>

pkgname=sqlate-git
pkgver=r36.1c21128
pkgrel=1
pkgdesc="Qt type-safe template-based SQL support"
arch=('i686' 'x86_64')
url="http://www.kdab.com/sqlate/"
license='LGPL'
depends=('qt4' 'boost-libs' 'unixodbc')
makedepends=('git' 'cmake' 'boost')
conflicts=('sqlate')
provides=('sqlate')
source=("git+https://github.com/KDAB/sqlate.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sqlate"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/sqlate"
  cmake CMakeLists.txt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/sqlate"
  make DESTDIR="${pkgdir}" install
}
