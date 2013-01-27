# Maintainer: Lukas Martini <hello@lutoma.org>
pkgname=srcpd
pkgver=2.1.1
pkgrel=1
pkgdesc="srcpd is a server for the Simple Railroad Control Protocol"
url="http://srcpd.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=('gcc' 'make')
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/project/srcpd/srcpd/2.1.1/srcpd-${pkgver}.tar.bz2")
md5sums=('f163e46308ec3e5549d0e4bb40fca7a8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

