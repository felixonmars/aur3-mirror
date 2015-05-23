# Maintainer: Ondřej Surý <ondrej@sury.org>

pkgname=fstrm
pkgver=0.2.0
pkgrel=1
pkgdesc="C implementation of the Frame Streams data transport protocol"
url="http://dnstap.info/"
license=('Apache')
arch=('i686' 'x86_64')
source=("https://github.com/farsightsec/fstrm/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad5d39957a4b334a6c7fcc94f308dc7ac75e1997cc642e9bb91a18fc0f42a98a')
options=(strip debug)

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix /usr
	make	
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
