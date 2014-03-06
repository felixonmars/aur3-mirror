# Maintainer: Thomas Etcheverria <tetcheve (at) gmail dot com>

pkgname=pdfadd
pkgver=1.2
pkgrel=3
pkgdesc="Making mathematic graphics with asymptote and LaTeX"

url="http://www.xm1math.net/pdfadd/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('qt4' 'asymptote' 'poppler-qt' 'texlive-core')

install=$pkgname.install

source=("http://www.xm1math.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('35b890602e97ac56ac52c4a550472809')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export INSTALL_ROOT="${pkgdir}"
  qmake-qt4 PREFIX=/usr "${pkgname}.pro"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  rm "${pkgdir}/usr/share/${pkgname}/COPYING"
}
