# Maintainer: Adrian Carpenter <adriatic.c@gmail.com>
# Contributor: Elen V. Chistyakova <miralita@gmail.com>

pkgname=oorexx
pkgver=4.2.0
pkgrel=1
pkgdesc="Open Object Rexx is free implementation of Object REXX, the procedural, object and human-oriented programming language."
arch=('i686' 'x86_64')
url="http://www.oorexx.org/"
license=('CPL')
depends=()
conflicts=(regina-rexx-das)
makedepends=()
source=(http://prdownloads.sourceforge.net/oorexx/ooRexx-${pkgver}-source.tar.gz)
md5sums=('f694c608a6790358fac73209e2b7b697')

build() {
  cd "${srcdir}/ooRexx-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/ooRexx-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

