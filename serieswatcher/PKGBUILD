# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=serieswatcher
pkgver=0.1.3
pkgrel=1
pkgdesc='A TV series browser and tracker application.'
arch=('i686' 'x86_64')
url='http://xf.iksaif.net/dev/serieswatcher.html'
license=('GPL')
depends=('openssl' 'qttvdb>=0.1' 'libzip' 'quazip')
makedepends=('cmake')
source=("http://xf.iksaif.net/dev/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('1c15277b4f54222be8fa04dd5021fc9d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install || return 1
}

