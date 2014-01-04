# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=ikusekurama
pkgver=0.1.0
pkgrel=1
pkgdesc='A tag based image browser'
arch=('i686' 'x86_64')
url='https://github.com/crumblingstatue/IkuseKurama'
license=('GPL')
depends=('qt5-base')
source=("https://github.com/crumblingstatue/IkuseKurama/archive/${pkgver}.tar.gz")
sha1sums=('fb4334f4686e4b034f30e6f799d64c103c1dad0c')

build() {
  cd "IkuseKurama-${pkgver}"
  mkdir build
  cd build
  qmake ..
  make
}

package() {
  cd "IkuseKurama-${pkgver}"
  cd build
  mkdir -p "${pkgdir}/usr/bin"
  cp IkuseKurama "${pkgdir}/usr/bin"
}
