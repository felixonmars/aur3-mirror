pkgname=xmlformat
pkgver=1.04
pkgrel=1
pkgdesc="A configurable formatter (or pretty-printer) for XML documents"
url="http://www.kitebird.com/software/xmlformat/"
arch=('any')
license=('BSD')
depends=('ruby')
source=(http://www.kitebird.com/software/xmlformat/${pkgname}-${pkgver}.tar.gz)
md5sums=('1703822838de817cead71f6ca2041137')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 xmlformat.rb -D "${pkgdir}/usr/bin/xmlformat" || return 1
}
