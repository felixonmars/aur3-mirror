# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=jamin
pkgver=0.95.0
pkgrel=8
pkgdesc="A JACK Audio Connection Kit Audio Mastering interface"
arch=('i686' 'x86_64')
url="http://jamin.sourceforge.net/"
license=('GPL')
depends=('jack' 'libxml2' 'gtk2' 'swh-plugins' 'fftw' 'liblo')
makedepends=('perlxml' 'ladspa')
options=('!libtool')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('032f2a4a578a8938f76282112d56c8d6')

build() {
    LDFLAGS="-ldl"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --mandir=/usr/share
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
