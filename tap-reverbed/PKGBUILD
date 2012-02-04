# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=tap-reverbed
pkgver=r0
pkgrel=2
pkgdesc="TAP reverb editor for the TAP reverberator."
arch=('i686' 'x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL')
depends=('jack' 'gtk2')
install=(reverbed.install)
source=(http://downloads.sourceforge.net/sourceforge/tap-plugins/${pkgname}-${pkgver}.tar.gz)
md5sums=('f8b15df131b45d2d5ef2e8d7c34e9a29')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	
	./configure --prefix="${pkgdir}/usr"
	make
	make install
	
	cd src/
	mkdir -p "${pkgdir}/usr/share/tap-reverbed"
	cp .reverbed "${pkgdir}/usr/share/tap-reverbed"
}
