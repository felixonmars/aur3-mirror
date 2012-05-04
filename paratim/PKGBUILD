# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>

pkgname=paratim
pkgver=0.2.0.1
pkgrel=1
pkgdesc="A remake of the old DOS game Paratrooper"
arch=('i686' 'x86_64')
url="http://paratim.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'sdl')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0ab215de57f29fc6e401e1fccea85902')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
