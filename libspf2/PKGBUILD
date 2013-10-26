# Maintainer: ushi <ushi+arch@honkgong.info>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Ian Armstrong <ian.k.armstrong@openmail.cc>
pkgname=libspf2
pkgver=1.2.10
pkgrel=1
pkgdesc="An implementation of the Sender Policy Framework"
arch=('i686' 'x86_64')
url="http://www.libspf2.org/"
license=("LGPL")
source=(http://www.libspf2.org/spf/$pkgname-$pkgver.tar.gz)
sha256sums=('d91e3de81ae287a2976c44f60283bd3000d720e6a112dc7142eedf1831b821c9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
