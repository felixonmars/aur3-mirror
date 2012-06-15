# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Andru <dr.andru@gmail.com>

pkgname=zengl
pkgver=0.2.9
pkgrel=1
pkgdesc="A cross-platform game development library written in Pascal"
arch=('i686' 'x86_64')
url="http://zengl.org/"
license=('LGPL3')
depends=('libxrandr' 'mesa')
makedepends=('fpc')
source=("http://zengl.org/zengl/${pkgname}-src-${pkgver}.tar.bz2")
md5sums=('338001334d412ce49ad4b7a988e0d635')

build() {
  cd "${srcdir}/${pkgname}-src-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-src-${pkgver}/src"
  mkdir -p "${pkgdir}/usr/lib"
  make DESTDIR="${pkgdir}/usr" install
}
