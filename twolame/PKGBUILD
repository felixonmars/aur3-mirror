# Contributor: farid abdelnour <farid at atelier-labs.org>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail.org>

pkgname=twolame
pkgver=0.3.13
pkgrel=5
pkgdesc="A fork of tooLAME - an optimized MPEG Audio Layer 2 (MP2) encoder."
arch=('i686' 'x86_64')
url="http://www.twolame.org/"
depends=('libsndfile')
options=('!libtool')
makedepends=()
license=('LGPL')
source=(http://downloads.sourceforge.net/twolame/twolame-${pkgver}.tar.gz)
md5sums=('4113d8aa80194459b45b83d4dbde8ddb')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
./configure --prefix=/usr
make
}

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR=${pkgdir} install
}

