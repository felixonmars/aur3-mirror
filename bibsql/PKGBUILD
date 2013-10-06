# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=bibsql
pkgver=0.05
pkgrel=1
pkgdesc="BibSQL is an replacement for BibTeX relying on a relational database instead a plain text file."
url="http://www.semanticlab.net/index.php/BibSQL"
arch=('x86_64' 'i686')
license=('GPL')
depends=()
makedepends=()
source=("http://ftp.math.utah.edu/pub/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('39de4150164dd248a21f60c522ed2309')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/" "${pkgdir}/usr/bin" "${pkgdir}/usr/man/" "${pkgdir}/usr/man/man1"
  make prefix="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
