# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=volleyball-data
pkgver=0.8.5
pkgrel=2
pkgdesc="Data files for the Volleyball game"
arch=('any')
url="http://www.losersjuegos.com.ar/juegos/volleyball"
license=('GPL')
source=("http://www.losersjuegos.com.ar/_media/juegos/volleyball/descargas/${pkgname}-${pkgver}.tar.gz")
md5sums=('f17bd48538ae9bdf6ec1e3fdae707375')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
