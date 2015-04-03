pkgname=xlink
pkgver=1.0
pkgrel=1
pkgdesc="data transfer and control system for the c64"
arch=('i686' 'x86_64')
url="http://www.henning-bekel.de/xlink"
license=('BSD')
depends=('libusb')
makedepends=('kickassembler')
source=("http://www.henning-bekel.de/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('cfe2f77d00ecf11d30811476d1d103be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
