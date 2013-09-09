# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=rasterview
pkgver=1.3
pkgrel=1
pkgdesc="A CUPS/PWG Raster file viewer"
arch=('i686' 'x86_64')
depends=('fltk')
url="http://www.msweet.org/projects.php?Z7"
license=('GPL')
install=${pkgname}.install
source=("http://www.msweet.org/files/project7/rasterview-${pkgver}.tar.gz")
md5sums=('8f615b5ef5e6e512aec25dc745bb330f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
