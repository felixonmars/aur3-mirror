# Maintainer: pisuka <tekmon@gmail.com>
pkgname=gsm-ussd
pkgver=0.3.3
pkgrel=1
_origpkgrel=0
pkgdesc="A small command line tool to send USSD commands over your phone or modem."
url="http://iloapp.zum-quadrat.de/blog/linux?Home&category=2"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('perl-expect>=1.21')
makedepends=('perl>=5.8')
source=("http://linux.zum-quadrat.de/downloads/${pkgname}_${pkgver}-${_origpkgrel}.tar.gz")
md5sums=('3578a7d5d35d23a68e1578e81597dc7d')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}-${_origpkgrel}"
  make all
}

package() {
  cd "${pkgdir}"
  mkdir -p usr/share/man
  cd usr/share/man
  mkdir -p man1 de/man1
  cd "${srcdir}/${pkgname}_${pkgver}-${_origpkgrel}"
  make PREFIX="${pkgdir}/usr" install install-doc
}

