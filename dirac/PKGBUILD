# Maintainer: Lukas Luther <lukasluther@googlemail.com>

pkgname=dirac
pkgver=1.0.2
pkgrel=1
pkgdesc="General-purpose video codec aimed at resolutions from QCIF (176x144) to HDTV (1920x1080) progressive or interlaced."
arch=('i686' 'x86_64')
url="http://dirac.sourceforge.net/"
depends=('gcc-libs' 'perl' 'cppunit' 'libtool')
makedepends=('doxygen' 'gcc43')
license=('MPL')
source=(http://downloads.sourceforge.net/dirac/${pkgname}-${pkgver}.tar.gz)
md5sums=('a57c2c5e58062d437d9ab13dffb28f0f')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	./configure --prefix=/usr --enable-mmx --enable-profile CC='gcc-4.3' CXX='g++-4.3'
	make || return 1
	make DESTDIR=$pkgdir install
}


