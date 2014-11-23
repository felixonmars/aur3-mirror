# Maintainer: Antonio Rojas

pkgname=prison-git
pkgver=v1.1.1.9.g3ec6541
pkgrel=1
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/prison'
pkgdesc='Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes'
license=('LGPL')
provides=('prison')
conflicts=('prison')
depends=('libdmtx' 'qrencode' 'qt5-base')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/prison.git")
md5sums=('SKIP')

pkgver() {
  cd prison
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build
  cmake ../prison \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT5_BUILD=ON \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
