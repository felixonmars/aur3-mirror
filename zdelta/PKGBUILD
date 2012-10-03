# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=zdelta
pkgver=2.1
pkgrel=1
pkgdesc="General purpose lossless delta compression library and command line utility (binary diff)."
url="http://cis.poly.edu/zdelta/"
arch=('x86_64' 'i686')
license=('custom')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=("http://cis.poly.edu/zdelta/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('03e6beb2e1235f2091f0146d7f41dd535aefb6078a48912d7d11973d5306de4c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CFLAGS="-O2 -W -Wall -pedantic -ansi -DREFNUM=1 -DNO_ERROR_CHECK" test || exit 1
}

package() {
 
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "${pkgdir}/usr/include"
  make prefix="${pkgdir}/usr" install
  cp zdc "${pkgdir}/usr/bin"
  cp zdu "${pkgdir}/usr/bin"
}
