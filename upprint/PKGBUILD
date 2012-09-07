# Contributor: Otakar Haška <ota.haska@seznam.cz>

pkgname=upprint
pkgver=1.7
pkgrel=1
pkgdesc="Tools for better n-up printing"
arch=('i686' 'x86_64')
url="http://www.mathstat.dal.ca/~selinger/upprint"
license=('GPL')
depends=('ghostscript' 'bash' 'cups' 'file' 'sed' 'awk')
makedepends=()
options=('!libtool')
source=(http://www.mathstat.dal.ca/~selinger/upprint/download/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-debug
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('f099dfd84aa4287dea006fc870a10ec8')
