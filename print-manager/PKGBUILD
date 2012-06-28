# Maintainer: vicky91 <vickypaiers@gmail.com>

pkgname=print-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="A kde tool for managing print jobs and printers"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/print-manager"
license=('GPL')
depends=('kdelibs' 'libcups')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=('7ba2de6051cd894b0d47fbbf3a2109c6')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
